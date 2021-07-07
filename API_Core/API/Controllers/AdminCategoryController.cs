using Models.EF;
using Microsoft.AspNetCore.Mvc;
using Service.Interface;
using System.Threading.Tasks;
using API.Helpers;
using Microsoft.AspNetCore.Authorization;
using API.Dto.Category;
using Models.ViewModels.Category;

namespace API.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]/[action]")]
    public class AdminCategoryController : ControllerBase
    {
        private readonly ICategoryService _categoryService;

        //CATEGORY KIND
        [AllowAnonymous]
        [HttpGet]
        public async Task<IActionResult> GetAllCateKind()
        {
            return Ok(await _categoryService.GetAllCateKind());
        }
        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> AddCateKind([FromBody] CateKind entity)
        {
            return Ok(await _categoryService.AddCateKind(entity));
        }

        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> UpdateCateKind([FromBody] CateKind entity)
        {
            return Ok(await _categoryService.UpdateCateKind(entity));
        }

        [AllowAnonymous]
        [HttpPost("{id}")]
        public async Task<IActionResult> DeleteCateKind(int id)
        {
            return Ok(await _categoryService.RemoveCateKind(id));
        }
        //KPI KIND

        public AdminCategoryController(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }


        // GET: Category
        [HttpPost]
        public async Task<IActionResult> Add( [FromBody]Category entity)
        {
            return Ok(await _categoryService.Add(entity));
        }

        [HttpPost]
        public async Task<IActionResult> Add2([FromBody]CategoryVM entity)
        {
            return Ok(await _categoryService.AddAsync(entity));
        }
        [HttpPost]
        public async Task<IActionResult> Update([FromBody]Category entity)
        {
            return Ok(await _categoryService.Update(entity));
        }

        [HttpPost]
        public async Task<IActionResult> Update2([FromBody]CategoryVM entity)
        {
            return Ok(await _categoryService.UpdateAsync(entity));
        }
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _categoryService.GetAll());
        }
        [HttpGet("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            return Ok(await _categoryService.Remove(id));
        }

        [AllowAnonymous]
        [HttpGet("{ID}")]
        public async Task<IActionResult> GetbyID(int ID)
        {
            return Ok(await _categoryService.GetById2(ID));
        }

        [AllowAnonymous]
        [HttpPost("{name}")]
        [HttpPost("{page}/{pageSize}/{name}/{lang}")]
        public async Task<IActionResult> LoadData(string name,string lang, int page = ConstantCommon.PAGE, int pageSize = ConstantCommon.PAGE_SIZE)
        {
            return Ok(await _categoryService.GetAllPaging2(name, lang, page, pageSize));
        }

        [AllowAnonymous]
        [HttpPost("{page}/{pageSize}")]
        [HttpPost("{page}/{pageSize}/{lang}")]
        public async Task<IActionResult> LoadData2(string name, string lang, int page = ConstantCommon.PAGE, int pageSize = ConstantCommon.PAGE_SIZE)
        {
            return Ok(await _categoryService.GetAllPaging3(name, lang, page, pageSize));
        }
       
    }
}