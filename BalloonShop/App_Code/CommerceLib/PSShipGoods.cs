namespace CommerceLib
{
  /// <summary>
  /// 6th pipeline stage – used to send a notification email to
  /// the supplier, stating that goods can be shipped
  /// </summary>

  public class PSShipGoods : IPipelineSection
  {
    private OrderProcessor orderProcessor;

    public void Process(OrderProcessor processor)
    {
      // set processor reference
      orderProcessor = processor;
      // audit
      orderProcessor.CreateAudit("PSShipGoods започна.", 20500);
      try
      {
        // send mail to supplier
        orderProcessor.MailSupplier("BalloonShop - доставка на стока.", //TODO
          GetMailBody());
        // audit
        orderProcessor.CreateAudit(
          "Email за доставка на стоки беше изпратен на доставчика.", 20502);
        // update order status
        orderProcessor.Order.UpdateStatus(6);
      }
      catch
      {
        // mail sending failure
        throw new OrderProcessorException(
          "Не можахме да изпратим Email на доставчика.", 5);
      }
      // audit
      processor.CreateAudit("PSShipGoods приключи.", 20501);
    }

    private string GetMailBody()
    {
      // construct message body
      string mail =
        "Беше заплатено за следните стоки:\n\n"
        + orderProcessor.Order.OrderAsString
        + "\n\nМоля доставете на:\n\n"
        + orderProcessor.Order.CustomerAddressAsString
        + "\n\nСлед доставката моля потвърдете на "
        + "http://www.example.com/AdminOrders.aspx"
        + "\n\nНомер на поръчката:\n\n"
        + orderProcessor.Order.OrderID.ToString();
      return mail;
    }
  }
}
