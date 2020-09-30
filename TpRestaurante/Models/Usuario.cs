using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;


namespace TpRestaurante.Models
{
    public class Usuario
    {
        public string id { get; set; }

        [Required(ErrorMessage = "Pone un Usuario/Email")]
        public string user { get; set; }

        [Required(ErrorMessage = "Pone un Contraseña")]
        public string pass { get; set; }

    }
}