using MobileShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAn_Mobileshop.Models.BUS
{
    public class LoaiSanPhamBUS
    {
        // --------- Khách hàng
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
        // ---------- Admin //
        public static IEnumerable<LoaiSanPham> DanhSachAdmin()
        {
            var db = new MobileShopConnectionDB();
            return db.Query<LoaiSanPham>("select * from LoaiSanPham");

        }

        public static void InsertLoaiSanPham(LoaiSanPham lsp)
        {
            var db = new MobileShopConnectionDB();
            db.Insert(lsp);


        }

        public static LoaiSanPham ChiTietAdmin(int id)
        {
            var db = new MobileShopConnectionDB();
            return db.SingleOrDefault<LoaiSanPham>("select * from LoaiSanPham where MaLoaiSanPham = @0", id);

        }

        public static void EditLoaiSanPham(int id,LoaiSanPham lsp)
        {
            var db = new MobileShopConnectionDB();
            db.Update(lsp, id);


        }

        public static void DeleteLoaiSanPham(int id, LoaiSanPham lsp)
        {
            var db = new MobileShopConnectionDB();
            db.Update(lsp, id);


        }


    }
}