package com.example.demo.lecture.web.customers;

import com.example.demo.lecture.service.CustomerService;
import com.example.demo.lecture.web.user.UserEditForm;

import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CustomersController {

  @Autowired
  CustomerService customerService;

  private Logger logger = LoggerFactory.getLogger(this.getClass());

  // 顧客一覧を表示する?
  @RequestMapping(path = "/customers", method = RequestMethod.GET)
  public String list(
    @PageableDefault(size = 10) Pageable pageable,
    Model model
  ) {
    var customers = customerService.findAll(pageable);
    model.addAttribute("customers", customers);
    return "pages/customer/list";
  }

  // @{/customer/{id}...は顧客一覧の詳細へボタン 顧客詳細に遷移する
  @RequestMapping(path = "customer/{id}")
  public String detail(
    Model model,
    @PathVariable("id") Long id,
    @RequestParam(name = "page", required = false, defaultValue = "1") int page,
    @RequestParam(name = "size", required = false, defaultValue = "10") int size
  ) {
    try {
      var customer = customerService.findOne(id);
      model.addAttribute("customer", customer);
      model.addAttribute("page", page);
      model.addAttribute("size", size);
    } catch (NotFoundException e) {
      logger.error("NotFound", e);
      return "redirect:/error/404";
    }
    return "pages/customer/detail";
  }

  //顧客登録 内容入力　GETで空のデータを渡して準備する
  @RequestMapping(path = "customer/create", method = RequestMethod.GET)
  public String showCreate(CustomerForm customerForm, Model model) {
    model.addAttribute("customerForm", customerForm);
    // 以下のものはPOST?
    return "pages/customer/create";
  }

  //顧客登録 登録ボタンを押した時
  @RequestMapping(path = "customer/create", method = RequestMethod.POST)
  public String create(
    @Valid @ModelAttribute CustomerForm customerForm,
    final BindingResult result
  ) {
    if (result.hasErrors()) {
      return "pages/customer/create";
    }
    // var → CustomerEntity型
    var customer = customerForm.toEntity();
    // JpaRepositoryインターフェースのsave() メソッドには戻り値がある！
    // Entity保存後にidのIncrement,createdAt(自動で更新される)など
    // 最新の状態を取得するために新しいオブジェクトを返す
    // save() メソッドはデータベースにエンティティを
    // 保存または更新し保存されたエンティティ（CustomerEntity 型）を返す
    customer = customerService.save(customer);
    // ここよくわからない 画面ではなく"customer/{id}"に行く? デバッグやる
        return "redirect:/customer/" + customer.getId();
  }

  // この下内容理解していない
  // 顧客情報編集画面へ　 idはcustomerIdかもしれない
  @RequestMapping(path = "customer/{id}/edit", method = RequestMethod.GET)
  public String showEdit(
    CustomerEditForm customerEditForm,
    Model model,
    @PathVariable("id") Long id,
    @RequestParam("page") int page,
    @RequestParam("size") int size
  ) {
    try {
      // 初期表示時に既に登録されている内容をフォームの中に反映
      var customer = customerService.findOne(id);
      customerEditForm.setEntity(customer);
      model.addAttribute("customerEditForm", customerEditForm);
      model.addAttribute("page", page);
      model.addAttribute("size", size);
    } catch (Exception e) {
      return "redirect:/error/404";
    }
    return "pages/customer/edit";
  }
  
  // 顧客情報更新画面へ
  @RequestMapping(path = "customer/{id}/edit", method = RequestMethod.POST)
  public String edit(
    @Valid @ModelAttribute CustomerEditForm customerEditForm,
    BindingResult result,
    Model model,
    @PathVariable("customerId") Long customerId,
    @RequestParam(name = "page") int page,
    @RequestParam(name = "size") int size,
    RedirectAttributes redirectAttributes
  ) {
    try {
      var customer = customerService.findOne(customerId);
      if (customer.getUpdatedAt().equals(customerEditForm.getUpdatedAtDateTime())) {
        logger.info("楽観ロック成功");
        customerEditForm.updateEntityAttributes(customer);
        customerService.save(customer);
      } else {
        logger.info("楽観ロック失敗");
        redirectAttributes.addFlashAttribute("error", "error.edit.lock_error");
        return "redirect:/customer/" + customerId;
      }
    } catch (NotFoundException e) {
      return "redirect:/error/404";
    }
    return "redirect:/customer/" + customerId + "?page=" + page + "&size=" + size;
  }
}
