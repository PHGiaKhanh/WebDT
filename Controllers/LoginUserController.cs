using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Web.Mvc;
using fptshop1.Models;


namespace fptshop1.Controllers
{
    public class LoginUserController : Controller
    {
        fptshop1Entities3 db = new fptshop1Entities3();
        // GET: LoginUser
        // Phương thức tạo view cho Login
        public ActionResult Index(int chon)
        {
            Session["chon"] = chon;
            return View();
        }

        // Xử lý tìm kiếm ID, password trong AdminUser và thông báo
        [HttpPost]
        public ActionResult LoginAcount(AdminUser _user, string chon)
        {
            var check = db.AdminUsers.Where(s => s.Username == _user.Username && s.Password == _user.Password).FirstOrDefault();
            if (check == null)
            {
                ViewBag.ErrorInfo = "Sai thông tin ";
                return View("Index");
            }
            else
            {
                db.Configuration.ValidateOnSaveEnabled = false;
                Session["UserName"] = _user.Username;
                Session["Passwod"] = _user.Password;
                Session["chon"] = chon;
                if (chon.ToString() == "1")
                    return RedirectToAction("Index", "ProDetails");
                else if (chon.ToString() == "2")
                    return RedirectToAction("Index", "Orders");
                else if (chon.ToString() == "3")
                    return RedirectToAction("Index", "Customers");
                else if (chon.ToString() == "4")
                    return RedirectToAction("Index", "Products");
                else if (chon.ToString() == "5")
                    return RedirectToAction("Index", "Suppliers");
                else if (chon.ToString() == "6")
                    return RedirectToAction("Index", "Categories");
                else if (chon.ToString() == "7")
                    return RedirectToAction("Index", "Colors");
                else if (chon.ToString() == "0")
                    return RedirectToAction("Details", "AdminUsers");

                return RedirectToAction("Index", "LoginUsers");
            }
        }
    }
}
