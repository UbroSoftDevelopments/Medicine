using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Cart
/// </summary>
public class PurchaseCart
{
    private Dictionary<int, PurchaseItemDetails> cartitems;
    private Dictionary<int, PurchaseItemDetails> cart2return;
    public PurchaseCart()
    {
        this.cartitems = new Dictionary<int, PurchaseItemDetails>();
        this.cart2return = new Dictionary<int, PurchaseItemDetails>();
    }
    public void AddtoCart(PurchaseItemDetails item)
    {
       cartitems.Add(item.ProductNo,item);
      
    }
    public void RemoveFromCart(int productno)
    {
        cartitems.Remove(productno);
    }

    public PurchaseItemDetails[] GetCart
    {

        get
        {
            /*PurchaseItemDetails[] cartDetails = cartitems.Values.ToArray();
            //PurchaseItemDetails[] cart2return = new PurchaseItemDetails[cartDetails.Length];
            for(int x=0;x<cartDetails.Length;x++){
                PurchaseItemDetails detail1 = cartDetails[x];
                int totalquantity=ProductUtilities.GetTotalMedicineQuantity(detail1.BoxNo,detail1.StripInsideBox,detail1.MedicineInsideStrip);
                PurchaseItemDetails pd = new PurchaseItemDetails(detail1.BillNo, totalquantity, detail1.Unit(), detail1.ProductName, detail1.BatchNo, detail1.Hsn, detail1.MRP, detail1.MRP, Convert.ToDateTime(detail1.MfgDate), Convert.ToDateTime(detail1.ExpiryDate), detail1.RackNo);
                cart2return.Add(x, pd);
            }*/
            return cartitems.Values.ToArray();
        }
    }

    public void SaveToDatabase(int billno)
    {

        Medicine.DataManager.DataSet1TableAdapters.purchaseitemTableAdapter da = new Medicine.DataManager.DataSet1TableAdapters.purchaseitemTableAdapter();
        Medicine.DataManager.DataSet1TableAdapters.medicinestockTableAdapter dda = new Medicine.DataManager.DataSet1TableAdapters.medicinestockTableAdapter();
        foreach (PurchaseItemDetails cartitem in cartitems.Values)
        {
            int newsno = MedicineEntryInStockcs.UpdateMedicineInStock(cartitem.ProductNo, cartitem.BoxNo, cartitem.StripInsideBox, cartitem.MedicineInsideStrip,cartitem.RackNo, cartitem.price(), cartitem.MRP, cartitem.BatchNo, cartitem.Hsn, cartitem.Unit(),Convert.ToDateTime( cartitem.ExpiryDate),Convert.ToDateTime( cartitem.MfgDate));

            da.InsertQuery(billno, cartitem.ProductName, cartitem.BatchNo, cartitem.price(), cartitem.MRP, Convert.ToDateTime(cartitem.MfgDate), Convert.ToDateTime(cartitem.ExpiryDate), cartitem.BoxNo, cartitem.StripInsideBox, cartitem.MedicineInsideStrip, cartitem.Unit(), cartitem.Hsn, /*cartitem.ProductNo*/newsno);

        }
          

    }
    public void Clear()
    {
        cartitems.Clear();
    }
}