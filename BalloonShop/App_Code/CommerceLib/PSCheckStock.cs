namespace CommerceLib
{
  /// <summary>
  /// 3rd pipeline stage – used to send a notification email to
  /// the supplier, asking whether goods are available
  /// </summary>
  public class PSCheckStock : IPipelineSection
  {
    private OrderProcessor orderProcessor;

    public void Process(OrderProcessor processor)
    {
      // set processor reference
      orderProcessor = processor;
      // audit
      orderProcessor.CreateAudit("PSCheckStock започна.", 20200);

      try
      {
        // send mail to supplier
        orderProcessor.MailSupplier("BalloonShop проверка за стоката.",
          GetMailBody());

        // audit
        orderProcessor.CreateAudit(
          "Известяващ Email беше изпратен на доставчика.", 20202);
        // update order status
        orderProcessor.Order.UpdateStatus(3);
      }
      catch
      {
        // mail sending failure
        throw new OrderProcessorException(
          "Не можахме да изпратим Email на доставчика.", 2);
      }
      // audit
      processor.CreateAudit("PSCheckStock приключи.", 20201);
    }

    private string GetMailBody()
    {
      // construct message body
      string mail = 
        "Следните стоки бяха поръчани:\n\n"
        + orderProcessor.Order.OrderAsString
        + "\n\nМоля проверете за наличност и потвърдете чрез"
        + "http://www.example.com/AdminOrders.aspx"
        + "\n\nПоръчка номер:\n\n"
        + orderProcessor.Order.OrderID.ToString();
      return mail;
    }
  }
}
