using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using fptshop1.Models;

namespace fptshop1.Controllers
{
    public class AdminUsersController : Controller
    {
        private fptshop1Entities3 db = new fptshop1Entities3();

        // GET: AdminUsers
        [HttpGet]
        public ActionResult Admin()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Admin(AdminUser ad)
        {
            if (ModelState.IsValid)
            {
                if (string.IsNullOrEmpty(ad.Username))
                    ModelState.AddModelError(string.Empty, "Tên đăng nhập không được để trống");
                if (string.IsNullOrEmpty(ad.Password))
                    ModelState.AddModelError(string.Empty, "Mật khẩu không được để trống");
                if (string.IsNullOrEmpty(ad.Role))
                    ModelState.AddModelError(string.Empty, "Role không được để trống");
                //Kiểm tra xem có người nào đã đăng kí với tên đăng nhậpnày hay chưa

                var quanly = db.AdminUsers.FirstOrDefault(k => k.Username == ad.Username);
                if (quanly != null)
                    ModelState.AddModelError(string.Empty, "Đã có người đăng kí tên này");
                if (ModelState.IsValid)
                {
                    db.AdminUsers.Add(ad);
                    db.SaveChanges();
                }
                else
                {
                    return View();
                }
            }
            return RedirectToAction("Login");
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(AdminUser ad)
        {
            if (ModelState.IsValid)
            {
                if (string.IsNullOrEmpty(ad.Username))
                    ModelState.AddModelError(string.Empty, "Tên đăng nhập không được để trống");
                if (string.IsNullOrEmpty(ad.Password))
                    ModelState.AddModelError(string.Empty, "Mật khẩu không được để trống");
                if (ModelState.IsValid)
                {
                    //Tìm khác hàng có tên đăng nhập và password họp le trong css
                    var quanly = db.AdminUsers.FirstOrDefault(k => k.Username == ad.Username && k.Password == ad.Password);
                    if (quanly != null)
                    {
                        ViewBag.ThongBao = "Chúc mừng đã đăng nhập thành công";
                        //Lưu vào session
                        Session["Taikhoan"] = quanly;
                    }
                    else
                        ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng";
                }


            }
            return RedirectToAction("Details");


        }
        public ActionResult Logout()
        {
            if (Session["TaiKhoan"] != null)
                Session["TaiKhoan"] = null;
            return RedirectToAction("Login", "Users");
        }

        // GET: AdminUsers/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AdminUser adminUser = db.AdminUsers.Find(id);
            if (adminUser == null)
            {
                return HttpNotFound();
            }
            return View(adminUser);
        }

        // GET: AdminUsers
        [HttpGet]
        public ActionResult ViewStart()
        {
            return View();
        }
    }
}
