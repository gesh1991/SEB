namespace CommerceLib
{
  /// <summary>
  /// 1st pipeline stage - used to send a notification email to
  /// the customer, confirming that the order has been received
  /// </summary>
  public class PSInitialNotification : IPipelineSection
  {
    private OrderProcessor orderProcessor;

    public void Process(OrderProcessor processor)
    {
      // set processor reference
      orderProcessor = processor;
      // audit
      orderProcessor.CreateAudit("PSInitialNotification започна.", 20000);

      try
      {
        // send mail to customer
        orderProcessor.MailCustomer("BalloonShop получи поръчката.", GetMailBody()); 
        // audit
        orderProcessor.CreateAudit(
          "Email беше изпратен на клиента.", 20002);
        // update order status
        orderProcessor.Order.UpdateStatus(1);
        // continue processing
        orderProcessor.ContinueNow = true;
      }
      catch
      {
        // mail sending failure
        throw new OrderProcessorException(
          "Не можахме да изпратим Email на клиента.", 0);
      }
      // audit
      processor.CreateAudit("PSInitialNotification приключи.", 20001);
    }

    private string GetMailBody()
    {
      // construct message body
      string mail;
      mail = "Благодарим Ви за поръчката. Продуктите които поръчахте "
           + "са:\n\n"
           + orderProcessor.Order.OrderAsString
           + "\n\nВашата поръчка ще бъде доставена на:\n\n"
           + orderProcessor.Order.CustomerAddressAsString
           + "\n\nномер на поръчката:\n\n"
           + orderProcessor.Order.OrderID.ToString()
           + "\n\nЩе получите потвърждаващ Email когато "
           + "поръчката Ви бъде изпратена. Благодарим Ви че пазарувахте "
           + "при нас!";
      return mail;
    }
  }
}
