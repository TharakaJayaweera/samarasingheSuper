package lk.samarasingher_super.asset.report;

import lk.samarasingher_super.asset.invoice.entity.Invoice;
import lk.samarasingher_super.asset.invoice.service.InvoiceService;
import lk.samarasingher_super.asset.payment.entity.Payment;
import lk.samarasingher_super.asset.payment.service.PaymentService;
import lk.samarasingher_super.util.service.DateTimeAgeService;
import lk.samarasingher_super.util.service.OperatorService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/report")
public class ReportController {
private final PaymentService paymentService;
private final InvoiceService invoiceService;
private final OperatorService operatorService;
  private final DateTimeAgeService dateTimeAgeService;

  public ReportController(PaymentService paymentService, InvoiceService invoiceService, OperatorService operatorService, DateTimeAgeService dateTimeAgeService) {
    this.paymentService = paymentService;
    this.invoiceService = invoiceService;
    this.operatorService = operatorService;
    this.dateTimeAgeService = dateTimeAgeService;
  }
  private String commonMethod(List< Payment > payments, List< Invoice > invoices, Model model, String message) {
    //according to payment type -> invoice
    //|-> card
    //|-> cash
    model.addAttribute("invoices", invoices);

    //according to payment type -> payment
    //|-> card
    //|-> cash
    model.addAttribute("payments", payments);
    // invoice count by cashier
    // item count according to item


    model.addAttribute("message", message);
    return "report/paymentAndIncomeReport";
  }
  @GetMapping
  public String getAllInvoiceAndPayment(Model  model){
    LocalDate localDate = LocalDate.now();
    String message = "This report is belongs to "+ localDate.toString();

    return commonMethod(
        paymentService.findByCreatedAtIsBetween(dateTimeAgeService.dateTimeToLocalDateStartInDay(localDate), dateTimeAgeService.dateTimeToLocalDateEndInDay(localDate))
        , invoiceService.findByCreatedAtIsBetween(dateTimeAgeService.dateTimeToLocalDateStartInDay(localDate), dateTimeAgeService.dateTimeToLocalDateEndInDay(localDate))
        , model, message);

  }


  @GetMapping( "/search" )
  public String getAllInvoiceAndPaymentBetweenTwoDate(@RequestAttribute( "startDate" ) LocalDate startDate,
                                                       @RequestAttribute( "endDate" ) LocalDate endDate, Model model) {
    String message = "This report is between from "+ startDate.toString()+" to "+ endDate.toString();
    return commonMethod(
        paymentService.findByCreatedAtIsBetween(dateTimeAgeService.dateTimeToLocalDateStartInDay(startDate), dateTimeAgeService.dateTimeToLocalDateEndInDay(endDate))
        , invoiceService.findByCreatedAtIsBetween(dateTimeAgeService.dateTimeToLocalDateStartInDay(startDate), dateTimeAgeService.dateTimeToLocalDateEndInDay(endDate))
        , model, message);
  }


}
