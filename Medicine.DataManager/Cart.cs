using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Medicine.DataManager
{
    public class Cart
    {
        int sno;
        private Dictionary<int, CartItem> cartitems;
        public Cart()
        {
            this.cartitems = new Dictionary<int, CartItem>();
        }
        public void AddtoCart(int sno, int stripinsidebox, int medicineincidestrip, int extra, float price)
        {
            this.sno = sno;
            MedicineDetails med = new MedicineDetails(sno, medicineincidestrip, stripinsidebox, extra, price);
            if (!med.Valid)
                throw new Exception("Invalid Medicine");
            int quantity = stripinsidebox * medicineincidestrip + extra;
            int totalquantity = quantity;
            if (cartitems.ContainsKey(sno))
            {
                CartItem cartitem;
                cartitems.TryGetValue(sno, out cartitem);
                totalquantity = totalquantity + cartitem.Quantity;

            }
            cartitems.Remove(sno);  
            CartItem newitem = new CartItem(sno, totalquantity, medicineincidestrip, stripinsidebox, extra, price);
            if (totalquantity <= 0)
                return;
            cartitems.Add(sno, newitem);
        }
        public void RemoveFromCart(int sno)
        {
            cartitems.Remove(sno);
        }

        public CartItem[] GetCart
        {

            get
            {
                return cartitems.Values.ToArray();
            }
        }

        public void SaveToDatabase(int receiptno)
        {
            DataSet1TableAdapters.receipt_itemsTableAdapter da = new DataSet1TableAdapters.receipt_itemsTableAdapter();
            foreach (CartItem cartitem in cartitems.Values)
                da.InsertQuery(receiptno, "" + cartitem.ProductName, cartitem.Quantity, Convert.ToDecimal(Math.Round(cartitem.Price, 2)), cartitem.serial());
        }
        public void Clear()
        {

            cartitems.Clear();
        }
    }
}
