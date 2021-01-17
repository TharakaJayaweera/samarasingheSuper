package lk.samarasingher_super.asset.report;

import lk.samarasingher_super.asset.common_asset.model.NameCount;
import lk.samarasingher_super.asset.common_asset.model.ParameterCount;
import lk.samarasingher_super.asset.common_asset.model.TwoDate;
import lk.samarasingher_super.asset.employee.entity.Employee;
import lk.samarasingher_super.asset.employee.service.EmployeeService;
import lk.samarasingher_super.asset.invoice.entity.Invoice;
import lk.samarasingher_super.asset.invoice.entity.enums.PaymentMethod;
import lk.samarasingher_super.asset.invoice.service.InvoiceService;
import lk.samarasingher_super.asset.invoice_ledger.entity.InvoiceLedger;
import lk.samarasingher_super.asset.invoice_ledger.service.InvoiceLedgerService;
import lk.samarasingher_super.asset.item.entity.Item;
import lk.samarasingher_super.asset.ledger.service.LedgerService;
import lk.samarasingher_super.asset.payment.entity.Payment;
import lk.samarasingher_super.asset.payment.service.PaymentService;
import lk.samarasingher_super.asset.user_management.user.service.UserService;
import lk.samarasingher_super.util.service.DateTimeAgeService;
import lk.samarasingher_super.util.service.OperatorService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collector;
import java.util.stream.Collectors;

@Controller
@RequestMapping( "/report" )
public class ReportController {
  private final PaymentService paymentService;
  private final InvoiceService invoiceService;
  private final OperatorService operatorService;
  private final DateTimeAgeService dateTimeAgeService;
  private final EmployeeService employeeService;
  private final UserService userService;
  private final LedgerService ledgerService;

  private final InvoiceLedgerService invoiceLedgerService;


  public ReportController(PaymentService paymentService, InvoiceService invoiceService,
                          OperatorService operatorService, DateTimeAgeService dateTimeAgeService,
                          EmployeeService employeeService, UserService userService, LedgerService ledgerService,
                          InvoiceLedgerService invoiceLedgerService) {
    this.paymentService = paymentService;
    this.invoiceService = invoiceService;
    this.operatorService = operatorService;
    this.dateTimeAgeService = dateTimeAgeService;
    this.employeeService = employeeService;
    this.userService = userService;
    this.ledgerService = ledgerService;
    this.invoiceLedgerService = invoiceLedgerService;
  }

  private String commonMethod(List< Payment > payments, List< Invoice > invoices, Model model, String message,
                              LocalDateTime startDateTime, LocalDateTime endDateTime) {

    //according to payment type -> invoice
    // invoice count
    int invoiceTotalCount = invoices.size();
    model.addAttribute("invoiceTotalCount", invoiceTotalCount);
    //|-> card
    List< Invoice > invoiceCards =
        invoices.stream().filter(x -> x.getPaymentMethod().equals(PaymentMethod.CREDIT)).collect(Collectors.toList());
    int invoiceCardCount = invoiceCards.size();
    AtomicReference< BigDecimal > invoiceCardAmount = new AtomicReference<>(BigDecimal.ZERO);
    invoiceCards.forEach(x -> {
      BigDecimal addAmount = operatorService.addition(invoiceCardAmount.get(), x.getTotalAmount());
      invoiceCardAmount.set(addAmount);
    });
    model.addAttribute("invoiceCardCount", invoiceCardCount);
    model.addAttribute("invoiceCardAmount", invoiceCardAmount.get());
    //|-> cash
    List< Invoice > invoiceCash =
        invoices.stream().filter(x -> x.getPaymentMethod().equals(PaymentMethod.CASH)).collect(Collectors.toList());
    int invoiceCashCount = invoiceCash.size();
    AtomicReference< BigDecimal > invoiceCashAmount = new AtomicReference<>(BigDecimal.ZERO);
    invoiceCash.forEach(x -> {
      BigDecimal addAmount = operatorService.addition(invoiceCashAmount.get(), x.getTotalAmount());
      invoiceCashAmount.set(addAmount);
    });
    model.addAttribute("invoiceCashCount", invoiceCashCount);
    model.addAttribute("invoiceCashAmount", invoiceCashAmount.get());
    //according to payment type -> payment
    // payment count
    int paymentTotalCount = invoices.size();
    model.addAttribute("paymentTotalCount", paymentTotalCount);
    //|-> card
    List< Payment > paymentCards =
        payments.stream().filter(x -> x.getPaymentMethod().equals(PaymentMethod.CREDIT)).collect(Collectors.toList());
    int paymentCardCount = paymentCards.size();
    AtomicReference< BigDecimal > paymentCardAmount = new AtomicReference<>(BigDecimal.ZERO);
    paymentCards.forEach(x -> {
      BigDecimal addAmount = operatorService.addition(paymentCardAmount.get(), x.getAmount());
      paymentCardAmount.set(addAmount);
    });
    model.addAttribute("paymentCardCount", paymentCardCount);
    model.addAttribute("paymentCardAmount", paymentCardAmount.get());
    //|-> cash
    List< Payment > paymentCash =
        payments.stream().filter(x -> x.getPaymentMethod().equals(PaymentMethod.CASH)).collect(Collectors.toList());
    int paymentCashCount = paymentCash.size();
    AtomicReference< BigDecimal > paymentCashAmount = new AtomicReference<>(BigDecimal.ZERO);
    paymentCash.forEach(x -> {
      BigDecimal addAmount = operatorService.addition(paymentCashAmount.get(), x.getAmount());
      paymentCashAmount.set(addAmount);
    });
    model.addAttribute("paymentCashCount", paymentCashCount);
    model.addAttribute("paymentCardAmount", paymentCashAmount.get());

    // invoice count by cashier
    List< NameCount > invoiceByCashierAndTotalAmount = new ArrayList<>();
//name, count, total
    HashSet< String > createdByAll = new HashSet<>();
    invoices.forEach(x -> createdByAll.add(x.getCreatedBy()));

    createdByAll.forEach(x -> {
      NameCount nameCount = new NameCount();
      Employee employee = userService.findByUserName(x).getEmployee();
      nameCount.setName(employee.getTitle().getTitle() + " " + employee.getName());
      AtomicReference< BigDecimal > cashierTotalCount = new AtomicReference<>(BigDecimal.ZERO);
      List< Invoice > cashierInvoice =
          invoices.stream().filter(a -> a.getCreatedBy().equals(x)).collect(Collectors.toList());
      nameCount.setCount(cashierInvoice.size());
      cashierInvoice.forEach(a -> {
        BigDecimal addAmount = operatorService.addition(cashierTotalCount.get(), a.getTotalAmount());
        cashierTotalCount.set(addAmount);
      });
      nameCount.setTotal(cashierTotalCount.get());
      invoiceByCashierAndTotalAmount.add(nameCount);
    });

    model.addAttribute("invoiceByCashierAndTotalAmount", invoiceByCashierAndTotalAmount);
    // invoice count by cashier
    List< NameCount > paymentByUserAndTotalAmount = new ArrayList<>();
//name, count, total
    HashSet< String > createdByAllPayment = new HashSet<>();
    payments.forEach(x -> createdByAllPayment.add(x.getCreatedBy()));

    createdByAllPayment.forEach(x -> {
      NameCount nameCount = new NameCount();
      Employee employee = userService.findByUserName(x).getEmployee();
      nameCount.setName(employee.getTitle().getTitle() + " " + employee.getName());
      AtomicReference< BigDecimal > userTotalCount = new AtomicReference<>(BigDecimal.ZERO);
      List< Payment > paymentUser =
          payments.stream().filter(a -> a.getCreatedBy().equals(x)).collect(Collectors.toList());
      nameCount.setCount(paymentUser.size());
      paymentUser.forEach(a -> {
        BigDecimal addAmount = operatorService.addition(userTotalCount.get(), a.getAmount());
        userTotalCount.set(addAmount);
      });
      nameCount.setTotal(userTotalCount.get());
      paymentByUserAndTotalAmount.add(nameCount);
    });

    model.addAttribute("paymentByUserAndTotalAmount", paymentByUserAndTotalAmount);
    // item count according to item
    HashSet< Item > invoiceItems = new HashSet<>();

    List< ParameterCount > itemNameAndItemCount = new ArrayList<>();

    List< InvoiceLedger > invoiceLedgers = invoiceLedgerService.findByCreatedAtIsBetween(startDateTime, endDateTime);
    invoiceLedgers.forEach(x -> invoiceItems.add(x.getLedger().getItem()));

    invoiceItems.forEach(x -> {
      ParameterCount parameterCount = new ParameterCount();
      parameterCount.setName(x.getName());
      parameterCount.setCount((int) invoiceLedgers
          .stream()
          .filter(a -> a.getLedger().getItem().equals(x))
          .count());
      itemNameAndItemCount.add(parameterCount);
    });
    model.addAttribute("itemNameAndItemCount", itemNameAndItemCount);

    model.addAttribute("message", message);
    return "report/paymentAndIncomeReport";
  }

  @GetMapping( "/manager" )
  public String getAllInvoiceAndPayment(Model model) {
    LocalDate localDate = LocalDate.now();
    String message = "This report is belongs to " + localDate.toString();
    LocalDateTime startDateTime = dateTimeAgeService.dateTimeToLocalDateStartInDay(localDate);
    LocalDateTime endDateTime = dateTimeAgeService.dateTimeToLocalDateEndInDay(localDate);

    return commonMethod(paymentService.findByCreatedAtIsBetween(startDateTime, endDateTime),
                        invoiceService.findByCreatedAtIsBetween(startDateTime, endDateTime), model, message,
                        startDateTime, endDateTime);

  }


  @PostMapping( "/manager/search" )
  public String getAllInvoiceAndPaymentBetweenTwoDate(@ModelAttribute("twoDate") TwoDate twoDate, Model model) {
    String message = "This report is between from " + twoDate.getStartDate().toString() + " to " + twoDate.getEndDate().toString();
    LocalDateTime startDateTime = dateTimeAgeService.dateTimeToLocalDateStartInDay(twoDate.getStartDate());
    LocalDateTime endDateTime = dateTimeAgeService.dateTimeToLocalDateEndInDay(twoDate.getEndDate());
    return commonMethod(paymentService.findByCreatedAtIsBetween(startDateTime, endDateTime),
                        invoiceService.findByCreatedAtIsBetween(startDateTime, endDateTime), model, message,
                        startDateTime, endDateTime);
  }


}
