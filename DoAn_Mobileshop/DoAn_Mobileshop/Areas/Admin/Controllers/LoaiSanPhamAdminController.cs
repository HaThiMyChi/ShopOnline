using DoAn_Mobileshop.Models.BUS;
using MobileShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAn_Mobileshop.Areas.Admin.Controllers
{
    public class LoaiSanPhamAdminController : Controller
    {
        // GET: Admin/LoaiSanPhamAdmin
        public ActionResult Index()
        {
            var db = LoaiSanPhamBUS.DanhSachAdmin();
            return View(db);
        }

        // GET: Admin/LoaiSanPhamAdmin/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Admin/LoaiSanPhamAdmin/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/LoaiSanPhamAdmin/Create
        [HttpPost]
        public ActionResult Create(LoaiSanPham id)
        {
            try
            {
                // TODO: Add insert logic here
                LoaiSanPhamBUS.InsertLoaiSanPham(id);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/LoaiSanPhamAdmin/Edit/5
        public ActionResult Edit(int id)
        {
            // load db theo id
            var db = LoaiSanPhamBUS.ChiTietAdmin(id);
            return View(db);
        }

        // POST: Admin/LoaiSanPhamAdmin/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, LoaiSanPham loaisanpham)
        {
            try
            {
                // TODO: Add update logic here
                LoaiSanPhamBUS.EditLoaiSanPham(id, loaisanpham);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/LoaiSanPhamAdmin/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Admin/LoaiSanPhamAdmin/Delete/5
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
        // POST: Admin/LoaiSanPhamAdmin/xoatamthoi
        public ActionResult XoaTamLoaiSanPham(int id)
        {
            return View(LoaiSanPhamBUS.ChiTietAdmin(id));
        }

    // POST: Admin/LoaiSanPhamAdmin/Deletexoatam

    [HttpPost]
    public ActionResult XoaTamLoaiSanPham(int id, LoaiSanPham loaisanpham)
    {
        try
        {
                // TODO: Add delete logic here
                loaisanpham.BiXoa = 1;
                LoaiSanPhamBUS.EditLoaiSanPham(id, loaisanpham);
                return RedirectToAction("Index");
        }
        catch
        {
            return View();
        }
    }
}


}
