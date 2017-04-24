using MobileShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAn_Mobileshop.Models.BUS
{
    public class MobileShopBUS
    {
        public static IEnumerable<SanPham> DanhSach()
        {
            var db = new MobileShopConnectionDB();
            return db.Query<SanPham>("Select * from SanPham");

        }

        public static SanPham ChiTiet(int id)
        {
            var db = new MobileShopConnectionDB();
            return db.SingleOrDefault<SanPham>("select * from SanPham where MaSanPham = @0 ", id);

        }

        //-----------Admin
        public static IEnumerable<SanPham> DanhSachAdmin()
        {
            var db = new MobileShopConnectionDB();
            return db.Query<SanPham>("Select * from SanPham");

        }

    }
}
    