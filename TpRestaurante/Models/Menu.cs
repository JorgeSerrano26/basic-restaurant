using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TpRestaurante.Models;
using System.ComponentModel.DataAnnotations;
namespace TpRestaurante.Models
{
    public class Menu
    {
        [Required(ErrorMessage = "Pone un Mapa")]
        public string IdMenu { get; set; }

        public HttpPostedFileBase file { get; set; }
        public string Imagen { get; set; }

        [Required(ErrorMessage = "Pone un Nombre")]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "Pone un Precio")]
        public string Precio { get; set; }      
    }
}