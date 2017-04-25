using DoAn_Mobileshop.Models.BUS;
using MobileShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAn_Mobileshop.Areas.Admin.Controllers
{
    public class SanPhamAdminController : Controller
    {
        // GET: Admin/SanPham
        public ActionResult Index()
        {
            return View(MobileShopBUS.DanhSachSPAdmin());
        }

        // GET: Admin/SanPham/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Admin/SanPham/Create
        public ActionResult Create()
        {
            ViewBag.MaNhaSanXuat = new SelectList(NhaSanXuatBUS.DanhSach(), "MaNhaSanXuat", "TenNhaSanXuat");
            ViewBag.MaLoaiSanPham = new SelectList(LoaiSanPhamBUS.DanhSach(), "MaLoaiSanPham", "TenLoaiSanPham");
            return View();
        }

        // POST: Admin/SanPham/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(SanPham sanpham)
        {
            //try
            //{
            // TODO: Add insert logic here
            if (HttpContext.Request.Files.Count > 0)
            {
                var hpf = HttpContext.Request.Files[0];
                if (hpf.ContentLength > 0)
                {
                    string fileName = Guid.NewGuid().ToString();

                    string fullPathWithFileName = "/images/products/" + fileName + ".jpg";
                    hpf.SaveAs(Server.MapPath(fullPathWithFileName));
                    sanpham.HinhAnh = fullPathWithFileName;
                }
            }
                    MobileShopBUS.InsertSanPham(sanpham);
            return RedirectToAction("Index");
            //    }
            //}
            //catch
            //{
            //    return View();
            //}
        }
    

        // GET: Admin/SanPham/Edit/5
        public ActionResult Edit(int id)
        {
            ViewBag.MaNhaSanXuat = new SelectList(NhaSanXuatBUS.DanhSach(), "MaNhaSanXuat", "TenNhaSanXuat");
            ViewBag.MaLoaiSanPham = new SelectList(LoaiSanPhamBUS.DanhSach(), "MaLoaiSanPham", "TenLoaiSanPham");
            return View(MobileShopBUS.ChiTiet(id));
        }

        // POST: Admin/SanPham/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, SanPham sp)
        {
            //try
            //{
            //    // TODO: Add update logic here
            {
                MobileShopBUS.EditSanPham(id, sp);
                return RedirectToAction("Index");
            }

           
            //catch
            //{
            //    return View();
            //}
        }

        // GET: Admin/SanPham/Delete/5
        public ActionResult Delete(int id)
        {
            MobileShopBUS.XoaTamSanPham(id);
            return RedirectToAction("Index");
        }

        // POST: Admin/SanPham/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
