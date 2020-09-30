using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TpRestaurante.Models;

namespace TpRestaurante.Controllers
{
    public class LaBirraController : Controller
    {

        // GET: LaBirra
        public ActionResult Index()
        {
            return View("Index", "Home");
        }
        public ActionResult Menu()
        {
            Consultas TraerDatos = new Consultas();
            List<Menu> Lista = TraerDatos.Menu();
            ViewBag.ListaMenu = Lista;
            return View();
        }
        public ActionResult Sucursales()
        {
            Consultas TraerDatos = new Consultas();
            ViewBag.Sucursales = TraerDatos.Sucursales();
            return View();
        }
        public ActionResult VerMas(string IdSucursal)
        {
            if (IdSucursal == null)
            {
                return RedirectToAction("Sucursales", "LaBirra");
            }
            try
            { ViewBag.Invalido = TempData["Invalido"].ToString(); }
            catch
            { TempData["Invalido"] = "false"; ViewBag.Invalido = TempData["Invalido"].ToString(); }

            Consultas TraerDatos = new Consultas();
            ViewBag.Datos = TraerDatos.SucursalCompleta(IdSucursal);
            ViewBag.Comentarios = TraerDatos.TraerComentarios(IdSucursal);
            return View();
        }
        [HttpPost]
        public ActionResult comentario(Comentario x)
        {
            TempData["Invalido"] = "true";
            if (ModelState.IsValid)
            {
                Consultas MandarDatos = new Consultas();
                MandarDatos.Comentario(x);
                TempData["Invalido"] = "false";
            }
            return RedirectToAction("VerMas", new { IdSucursal = x.idsucursal });
        }

        //LOGIN
        public ActionResult Login()
        {
            if (Session["Usuario"] == null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Panel");
            }

        }
        [HttpPost]
        public ActionResult Login(Usuario x)
        {
            if (ModelState.IsValid)
            {
                string id = null;
                Consultas Log = new Consultas();
                bool entro = Log.Login(x.user, x.pass, ref id);
                if (entro)
                {
                    x.id = id;
                    Log.UltimaConexion(x.id);
                    Session["Usuario"] = x.user;
                    Session["Contraseña"] = x.pass;
                    return RedirectToAction("Panel");
                }
                else
                {

                    ViewBag.Noentro = "true";
                    return View();
                }
            }
            return View();
        }
        public ActionResult CerrarSesion()
        {
            Session.Clear();

            Session.Abandon();

            Session.RemoveAll();

            Session["Usuario"] = null;
            return View("Login");

        }

        //PANEL
        public ActionResult Panel()
        {
            if (Session["Usuario"] == null)
            {
                return View("Login");
            }
            else
            {
                Consultas Dat = new Consultas();
                ViewBag.Comentarios = Dat.ComentariosNoAprobados();
                return View();
            }
        }
        public ActionResult Aprobar(string IdComentario, bool Aprobado)
        {
            Consultas Dat = new Consultas();
            if (Aprobado)
            {
                Dat.AprobarComentario(IdComentario, Aprobado);
            }
            else
            {
                Dat.EliminarComentario(IdComentario);
            }

            return RedirectToAction("Panel");
        }

        //HERRAMIENTOAS SUCURSAL
        public ActionResult AdmSucursales()
        {
            if (Session["Usuario"] == null)
            {
                return View("Login");
            }
            Consultas TraerDatos = new Consultas();
            ViewBag.Sucursales = TraerDatos.Sucursales();
            return View();
        }
        public ActionResult EliminarSucursal(string IdSucursal)
        {
            if (Session["Usuario"] == null)
            {
                return View("Login");
            }
            else
            {
                if (IdSucursal == "")
                {
                    return RedirectToAction("AdmSucursales");
                }
                Consultas dat = new Consultas();
                dat.EliminarSucursal(IdSucursal);
                return RedirectToAction("AdmSucursales");
            }

        }
        public ActionResult ModificarSucursal(string IdSucursal)
        {
            if (Session["Usuario"] == null)
            {
                return View("Login");
            }
            else
            {
                if (IdSucursal == "")
                {
                    return RedirectToAction("AdmSucursales");
                }
                Consultas Dat = new Consultas();
                Sucursales Sucur = Dat.SucursalCompleta(IdSucursal);
                return View("ModificarSucursal", Sucur);
            }
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult ModificarSucursal(Sucursales x)
        {
            if (ModelState.IsValid)
            {
                if (x.file != null)
                {
                    int b = 0; Random a = new Random(); bool existe; string path;

                    path = Server.MapPath("~/Content/Img/") + x.file.FileName;
                    /*string extension = Path.GetExtension(path);*/
                    existe = (System.IO.File.Exists(path));
                    while (existe)
                    {
                        b = a.Next(200);
                        path = Server.MapPath("~/Content/Img/") + b + x.file.FileName;
                        existe = (System.IO.File.Exists(path));
                    }

                    x.file.SaveAs(path);
                    x.Imagen = x.file.FileName;
                }
                Consultas dat = new Consultas();
                dat.ModSucursales(x);
            }
            return RedirectToAction("AdmSucursales");
        }

        //HERRAMIENTAS MENU
        public ActionResult AdmMenu()
        {
            if (Session["Usuario"] == null)
            {
                return View("Login");
            }
            Consultas TraerDatos = new Consultas();
            List<Menu> Lista = TraerDatos.Menu();
            ViewBag.ListaMenu = Lista;
            return View();
        }
        public ActionResult EliminarMenu(string IdMenu)
        {
            Consultas dat = new Consultas();
            dat.EliminarMenu(IdMenu);
            return RedirectToAction("AdmMenu");
        }
        public ActionResult ModificarMenu(string IdMenu)
        {
            Consultas Dat = new Consultas();
            Menu Menu = Dat.MenuCompleto(IdMenu);
            return View("ModificarMenu", Menu);

        }
        [HttpPost, ValidateInput(false)]
        public ActionResult ModificarMenu(Menu x)
        {
            if (ModelState.IsValid)
            {
                if (x.file != null)
                {
                    int b = 0; Random a = new Random(); bool existe; string path;
                    path = Server.MapPath("~/Content/Img/") + x.file.FileName;
                    existe = (System.IO.File.Exists(path));
                    while (existe)
                    {
                        b = a.Next(200);
                        path = Server.MapPath("~/Content/Img/") + b + x.file.FileName;
                        existe = (System.IO.File.Exists(path));
                    }
                    x.file.SaveAs(path);
                    x.Imagen = x.file.FileName;
                }
                Consultas dat = new Consultas();
                dat.ModMenu(x);
            }
            return RedirectToAction("AdmMenu");
        }
    }
}