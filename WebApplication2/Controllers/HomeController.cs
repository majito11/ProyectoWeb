using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace WebApplication2.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Administrador u){
            if (ModelState.IsValid) {

                   using (ReservasEntities db = new ReservasEntities()) {

                   var v = db.AdministradorSet.Where(a => a.UsuarioAdministrador.Equals(a.UsuarioAdministrador) && a.PasswordAdministrador.Equals(a.PasswordAdministrador)).FirstOrDefault();
                   if (v != null) {
                        Session["LogedUserID"] = v.IdAdministrador.ToString();
                        Session["LogedUserFullName"] = v.UsuarioAdministrador.ToString();
                        return RedirectToAction("AfterLogin");
                    }
                }

            }
            return View(u); 

        }

  
        public ActionResult LogOut()
        {
           
            Session.Clear();
            
            return RedirectToAction("Login");
        }


        public ActionResult AfterLogin() {
            if (Session["LogedUserID"] != null)
            {
                return View();
            }
            else {
                return RedirectToAction("Index");
            }
        }

       public ActionResult GetLocations()
        {

            var Locations = new List<Models.Locations>() {
                 new Models.Locations("-0,725485", "-78,397690"),
                 new Models.Locations("-2,144987", "-78,326279"),
                 new Models.Locations("-1.968256", "-78.517227")  
                
            };

            return Json(Locations, JsonRequestBehavior.AllowGet);

        }
    }

    

}