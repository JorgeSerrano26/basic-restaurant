using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using TpRestaurante.Models;

namespace TpRestaurante.Models
{
    public class Comentario
    {
        public string idsucursal { get; set; }
        public string idcomentario { get; set; }

        [Required(ErrorMessage = "Pon un nombre")]
        public string Nom { get; set; }

        [Required(ErrorMessage = "Pon un comentario")]
        public string com { get; set; }

        [Required(ErrorMessage = "Pon una calificacion")]
        public string calificacion { get; set; }

    }
}