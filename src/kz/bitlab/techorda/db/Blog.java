package kz.bitlab.techorda.db;

    public class Blog {
        int id;
        String time;
        int categoryId;

        String title;

        String content;

        public Blog() {
        }

        public Blog(int id, String time, int categoryId, String title, String content) {
            this.id = id;
            this.time = time;
            this.categoryId = categoryId;
            this.title = title;
            this.content = content;
        }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getTime() {
            return time;
        }

        public void setTime(String time) {
            this.time = time;
        }

        public int getCategoryId() {
            return categoryId;
        }

        public void setCategoryId(int categoryId) {
            this.categoryId = categoryId;
        }

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }

        public String getContent() {
            return content;
        }

        public void setContent(String content) {
            this.content = content;
        }
    }

