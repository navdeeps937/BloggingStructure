using BloggingService.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BloggingService.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class BlogController : ControllerBase
    {
        private readonly BloggingStructureContext _context;

        public BlogController(BloggingStructureContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<BlogDetails>>> GetBlogs(int? skip, int? take)
        {
            var blogs = _context.BlogDetails.AsQueryable();
            if (skip != null)
            {
                blogs = blogs.Skip((int)skip);
            }

            if (take != null)
            {
                blogs = blogs.Take((int)take);
            }

            return await blogs.ToListAsync();
        }

        // GET: api/Blog/5
        [HttpGet("{id}")]
        public async Task<ActionResult<BlogDetails>> GetBlogs(int id)
        {
            var blogs = await _context.BlogDetails.FindAsync(id);

            if (blogs == null)
            {
                return NotFound();
            }

            return blogs;
        }

        // PUT api/Blog/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBlogs(int id, BlogDetails blogs)
        {
            if (id != blogs.ArticleId)
            {
                return BadRequest();
            }
            _context.Entry(blogs).State = EntityState.Modified;
            try
            {
                blogs.ModifiedDate = DateTime.Now;
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BlogExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
            return NoContent();
        }

        [HttpPost]
        public async Task<ActionResult<BlogDetails>> PostBlogs(BlogDetails blogs)
        {
            _context.BlogDetails.Add(blogs);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetBlogs", new { id = blogs.ArticleId }, blogs);
        }

        // DELETE: api/Blogs/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<BlogDetails>> DeleteBlogs(int id)
        {
            var blogs = await _context.BlogDetails.FindAsync(id);
            if (blogs == null)
            {
                return NotFound();
            }

            _context.BlogDetails.Remove(blogs);
            await _context.SaveChangesAsync();

            return blogs;
        }


        private bool BlogExists(int id)
        {
            return _context.BlogDetails.Any(e => e.ArticleId == id);
        }

    }
}
