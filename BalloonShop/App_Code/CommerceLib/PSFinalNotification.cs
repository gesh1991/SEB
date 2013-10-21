namespace CommerceLib
{
  /// <summary>
  /// 8th pipeline stage - used to send a notification email to
  /// the customer, confirming that the order has been shipped
  /// </summary>
  public class PSFinalNotification : IPipelineSection
  {
    private OrderProcessor orderProcessor;

    public void Process(OrderProcessor processor)
    {
      // set processor reference
      orderProcessor = processor;
      // audit
      orderProcessor.CreateAudit("PSFinalNotification започна.",
        20700);
      try
      {
        // send mail to customer
        orderProcessor.MailCustomer("BalloonShop order dispatched.", //TODO
          GetMailBody());
        // audit
        orderProcessor.CreateAudit(
          "Email беше изпратен на клиента.", 20702);
        // update order status
        orderProcessor.Order.UpdateStatus(8);
      }
      catch
      {
        // mail sending failure
        throw new OrderProcessorException(
          "Не можахме да изпратим Email на клиента.", 7);
      }
      // audit
      processor.CreateAudit("PSFinalNotification приключи.", 20701);
    }

    private string GetMailBody()
    {
      // construct message body
      string mail =
          "Поръчката беше изпратена! Следните "
        + "продукти ще бъдат доставени:\n\n"
        + orderProcessor.Order.OrderAsString
        + "\n\nПоръчката Ви е доставена на:\n\n"
        + orderProcessor.Order.CustomerAddressAsString
        + "\n\nНомер на поръчката:\n\n"
        + orderProcessor.Order.OrderID.ToString()
        + "\n\nБлагодарим Ви че пазарувахте при нас!";
      return mail;
    }
  }
}
