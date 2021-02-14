using System;
using System.Collections.Generic;

namespace BloggingService.Models
{
    public partial class BlogDetails
    {
        public int ArticleId { get; set; }
        public string Title { get; set; }
        public string Abstract { get; set; }
        public string Contents { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
}
