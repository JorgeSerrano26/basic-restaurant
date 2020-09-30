using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using TpRestaurante.Models;

namespace TpRestaurante.Models
{
    public class Sucursales
    {
        public string IdSucursal { get; set; }

        [Required(ErrorMessage = "Pone un Mapa")]
        public string Mapa { get; set; }

        public HttpPostedFileBase file { get; set; }
        public string Imagen { get; set; }
        public string Provincia { get; set; }

        [Required(ErrorMessage = "Pone un Domicilio")]
        public string Domicilio { get; set; }

        [Required(ErrorMessage = "Pone una Telefono")]
        public string Telefono { get; set; }
    }
}