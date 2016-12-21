using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebStore.Models;
using System.Web.ModelBinding;

namespace WebStore
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Product> GetProduct([QueryString("productID")] int? productId)
        {
            var _db = new WebStore.Models.ProductContext();
            IQueryable<Product> querry = _db.Products;
            if (productId.HasValue && productId > 0)
            {
                querry = querry.Where(p => p.ProductID == productId);
            }
            else
            {
                querry = null;
            }
            return querry;
        }
    }
}