using MobileShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAn_Mobileshop.Models.BUS
{
    public class NhaSanXuatBUS
    {
        // Khách hàng //
        public static IEnumerable<NhaSanXuat> DanhSach()
        {
            var db = new MobileShopConnectionDB();
            return db.Query<NhaSanXuat>("select * from NhaSanXuat where BiXoa = 0");

        }

     public static IEnumerable<SanPham> ChiTiet(int id)
        {
            var db = new MobileShopConnectionDB();
            return db.Query<SanPham>("select * from SanPham where MaNhaSanXuat = @0", id);

        }

        // --- Admin//
        public static IEnumerable<NhaSanXuat> DanhSachAdmin()
        {
            var db = new MobileShopConnectionDB();
            return db.Query<NhaSanXuat>("select * from NhaSanXuat");

        }

        public static NhaSanXuat ChiTietAdmin(int id)
        {
            var db = new MobileShopConnectionDB();
            return db.SingleOrDefault<NhaSanXuat>("select * from NhaSanXuat where MaNhaSanXuat = @0 ", id);

        }

        public static void ThemNSX(NhaSanXuat nsx)
        {
            var db = new  MobileShopConnectionDB();
            db.Insert(nsx);
        }

        public static void UpdateNhaSanXuat(int id, NhaSanXuat nsx)
        {
            var db = new MobileShopConnectionDB();
            db.Update(nsx, id);
        }
    }
}