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
            return db.Query<SanPham>("Select * from SanPham where BiXoa!=1");

        }

        public static SanPham ChiTiet(int id)
        {
            var db = new MobileShopConnectionDB();
            return db.SingleOrDefault<SanPham>("select * from SanPham where MaSanPham = @0 ", id);

        }

        //-----------Admin
        public static IEnumerable<SanPham> DanhSachSPAdmin()
        {
            var db = new MobileShopConnectionDB();
            return db.Query<SanPham>("Select * from SanPham where BiXoa != 1");

        }

        public static void InsertSanPham(SanPham sanpham)
        {
            var db = new MobileShopConnectionDB();
            db.Insert(sanpham);

        }
        public static void EditSanPham(int id, MobileShopConnection.SanPham sp)
        {
            var db = new MobileShopConnectionDB();

            db.Update<SanPham>("SET TenSanPham=@0, MoTa=@1, XuatXu=@2, MaNhaSanXuat=@3, GiaBan=@4, SoLuongBan=@5, SoLuongTon=@6, MaLoaiSanPham=@7, HinhAnh=@8 where MaSanPham=@9", sp.TenSanPham, sp.MoTa, sp.XuatXu, sp.MaNhaSanXuat, sp.GiaBan, sp.SoLuongBan, sp.SoLuongTon, sp.MaLoaiSanPham, sp.HinhAnh, id);
            //return db.SingleOrDefault<SanPham>("select * from SanPham where MaSanPham = @0", id);
        }
        public static void XoaTamSanPham(int id)
        {
            var db = new MobileShopConnectionDB();

            db.Update<SanPham>("SET BiXoa=1 where MaSanPham=@0", id);
            //return db.SingleOrDefault<SanPham>("select * from SanPham where MaSanPham = @0", id);
        }
    }
}
    