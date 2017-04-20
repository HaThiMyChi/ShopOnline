using MobileShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAn_Mobileshop.Models.BUS
{
    public class LoaiSanPhamBUS
    {
        public static IEnumerable<LoaiSanPham> DanhSach()
        {
            var db = new MobileShopConnectionDB();
            return db.Query<LoaiSanPham>("select * from LoaiSanPham where BiXoa = 0");

        }

        public static IEnumerable<SanPham> ChiTiet(int id)
        {
            var db = new MobileShopConnectionDB();
            return db.Query<SanPham>("select * from SanPham where MaLoaiSanPham = @0",id);

        }
    }
}