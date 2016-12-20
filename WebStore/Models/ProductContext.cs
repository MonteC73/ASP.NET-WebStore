using System.Data.Entity;

namespace WebStore.Models
{
    public class ProductContext : DbContext
    {
        public ProductContext() : base("WebStore")
        {
            
        }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Product> Products { get; set; }
    }
}