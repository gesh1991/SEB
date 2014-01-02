using DataCashLib;

namespace CommerceLib
{
  /// <summary>
  /// 5th pipeline stage – takes funds from customer
  /// </summary>
  public class PSTakePayment : IPipelineSection
  {
    private OrderProcessor orderProcessor;

    public void Process(OrderProcessor processor)
    {
      // set processor reference
      orderProcessor = processor;
      // audit
      orderProcessor.CreateAudit("PSTakePayment започна.", 20400);
      try
      {
        // take customer funds via DataCash gateway
        // configure DataCash XML request
        DataCashRequest request = new DataCashRequest();
        request.Authentication.Client =
          BalloonShopConfiguration.DataCashClient;

        request.Authentication.Password =
          BalloonShopConfiguration.DataCashPassword;
        request.Transaction.HistoricTxn.Method =
          "fulfill";
        request.Transaction.HistoricTxn.AuthCode =
          orderProcessor.Order.AuthCode;
        request.Transaction.HistoricTxn.Reference =
          orderProcessor.Order.Reference;
        // get DataCash response
        DataCashResponse response =
          request.GetResponse(
          BalloonShopConfiguration.DataCashUrl);
        if (response.Status == "1")
        {
          // audit
          orderProcessor.CreateAudit(
            "Сумата беше взета от кредитната карта на клиента.",
            20402);
          // update order status
          orderProcessor.Order.UpdateStatus(5);
          // continue processing
          orderProcessor.ContinueNow = true;
        }
        else
        {
          // audit
          orderProcessor.CreateAudit(
           "Възникна проблем при извличането на средства от сметката на клиента.",
           20403);
          // mail admin
          orderProcessor.MailAdmin(
            "Картата беше отхвърлена.",
            "XML данни за грешката:\n" + request.Xml + "\n\n" +
            response.Xml, 1);
        }
      }
      catch
      {
        // fund checking failure
        throw new OrderProcessorException(
          "Възникна грешка.", 4);
      }
      // audit
      processor.CreateAudit("PSTakePayment приключи.", 20401);
    }
  }
}
