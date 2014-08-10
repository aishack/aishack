PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "django_admin_log" (
    "id" integer NOT NULL PRIMARY KEY,
    "action_time" datetime NOT NULL,
    "user_id" integer NOT NULL,
    "content_type_id" integer,
    "object_id" text,
    "object_repr" varchar(200) NOT NULL,
    "action_flag" smallint unsigned NOT NULL,
    "change_message" text NOT NULL
);
INSERT INTO "django_admin_log" VALUES(1,'2014-08-03 17:34:54.302048',1,8,'1','Uncategorized',1,'');
INSERT INTO "django_admin_log" VALUES(2,'2014-08-03 17:35:15.150574',1,8,'2','Computer vision',1,'');
INSERT INTO "django_admin_log" VALUES(3,'2014-08-04 17:03:59.729150',1,9,'1','test',1,'');
INSERT INTO "django_admin_log" VALUES(4,'2014-08-04 17:04:06.769380',1,9,'1','test',3,'');
INSERT INTO "django_admin_log" VALUES(5,'2014-08-09 05:59:24.948843',1,4,'1','utkarsh',2,'Changed first_name and last_name.');
INSERT INTO "django_admin_log" VALUES(6,'2014-08-09 06:54:01.916910',1,4,'1','utkarsh',2,'Added aishack user "AishackUser object".');
INSERT INTO "django_admin_log" VALUES(7,'2014-08-09 06:54:07.477869',1,4,'1','utkarsh',2,'No fields changed.');
INSERT INTO "django_admin_log" VALUES(8,'2014-08-09 07:06:54.924592',1,4,'1','utkarsh',2,'Changed website for aishack user "AishackUser object".');
INSERT INTO "django_admin_log" VALUES(9,'2014-08-09 07:17:35.441058',1,4,'1','utkarsh',2,'Changed short_bio for aishack user "AishackUser object".');
INSERT INTO "django_admin_log" VALUES(10,'2014-08-09 07:27:27.659140',1,4,'1','utkarsh',2,'Changed short_bio for aishack user "AishackUser object".');
INSERT INTO "django_admin_log" VALUES(11,'2014-08-09 14:45:16.201860',1,8,'3','OpenCV',1,'');
INSERT INTO "django_admin_log" VALUES(12,'2014-08-09 15:13:09.519469',1,8,'4','Electronics',1,'');
INSERT INTO "django_admin_log" VALUES(13,'2014-08-09 16:16:50.557082',1,8,'5','General',1,'');
INSERT INTO "django_admin_log" VALUES(14,'2014-08-09 16:19:09.080956',1,4,'2','shervin',2,'Changed is_superuser and is_staff. Added aishack user "AishackUser object".');
INSERT INTO "django_admin_log" VALUES(15,'2014-08-09 16:24:57.056592',1,4,'2','shervin',2,'Changed short_bio for aishack user "AishackUser object".');
INSERT INTO "django_admin_log" VALUES(16,'2014-08-09 16:25:25.900756',1,4,'2','shervin',2,'Changed short_bio for aishack user "AishackUser object".');
INSERT INTO "django_admin_log" VALUES(17,'2014-08-09 17:18:19.346527',1,7,'19','Histograms with inbuilt functions of OpenCV',3,'');
INSERT INTO "django_admin_log" VALUES(18,'2014-08-09 17:19:22.697604',1,7,'19','Histograms with functions of OpenCV',3,'');
INSERT INTO "django_admin_log" VALUES(19,'2014-08-09 18:31:30.132404',1,7,'30','SuDoKu Grabber with OpenCV',3,'');
INSERT INTO "django_admin_log" VALUES(20,'2014-08-10 06:17:55.325918',1,7,'36','The Hough Transform: Basics',3,'');
INSERT INTO "django_admin_log" VALUES(21,'2014-08-10 06:37:07.157116',1,8,'6','Machine learning',1,'');
INSERT INTO "django_admin_log" VALUES(22,'2014-08-10 06:53:23.639412',1,7,'43','Noise Models',3,'');
INSERT INTO "django_admin_log" VALUES(23,'2014-08-10 06:55:24.888978',1,7,'43','Noise Models',3,'');
CREATE TABLE "auth_permission" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(50) NOT NULL,
    "content_type_id" integer NOT NULL,
    "codename" varchar(100) NOT NULL,
    UNIQUE ("content_type_id", "codename")
);
INSERT INTO "auth_permission" VALUES(1,'Can add log entry',1,'add_logentry');
INSERT INTO "auth_permission" VALUES(2,'Can change log entry',1,'change_logentry');
INSERT INTO "auth_permission" VALUES(3,'Can delete log entry',1,'delete_logentry');
INSERT INTO "auth_permission" VALUES(4,'Can add permission',2,'add_permission');
INSERT INTO "auth_permission" VALUES(5,'Can change permission',2,'change_permission');
INSERT INTO "auth_permission" VALUES(6,'Can delete permission',2,'delete_permission');
INSERT INTO "auth_permission" VALUES(7,'Can add group',3,'add_group');
INSERT INTO "auth_permission" VALUES(8,'Can change group',3,'change_group');
INSERT INTO "auth_permission" VALUES(9,'Can delete group',3,'delete_group');
INSERT INTO "auth_permission" VALUES(10,'Can add user',4,'add_user');
INSERT INTO "auth_permission" VALUES(11,'Can change user',4,'change_user');
INSERT INTO "auth_permission" VALUES(12,'Can delete user',4,'delete_user');
INSERT INTO "auth_permission" VALUES(13,'Can add content type',5,'add_contenttype');
INSERT INTO "auth_permission" VALUES(14,'Can change content type',5,'change_contenttype');
INSERT INTO "auth_permission" VALUES(15,'Can delete content type',5,'delete_contenttype');
INSERT INTO "auth_permission" VALUES(16,'Can add session',6,'add_session');
INSERT INTO "auth_permission" VALUES(17,'Can change session',6,'change_session');
INSERT INTO "auth_permission" VALUES(18,'Can delete session',6,'delete_session');
INSERT INTO "auth_permission" VALUES(19,'Can add tutorial',7,'add_tutorial');
INSERT INTO "auth_permission" VALUES(20,'Can change tutorial',7,'change_tutorial');
INSERT INTO "auth_permission" VALUES(21,'Can delete tutorial',7,'delete_tutorial');
INSERT INTO "auth_permission" VALUES(22,'Can add category',8,'add_category');
INSERT INTO "auth_permission" VALUES(23,'Can change category',8,'change_category');
INSERT INTO "auth_permission" VALUES(24,'Can delete category',8,'delete_category');
INSERT INTO "auth_permission" VALUES(25,'Can add track',9,'add_track');
INSERT INTO "auth_permission" VALUES(26,'Can change track',9,'change_track');
INSERT INTO "auth_permission" VALUES(27,'Can delete track',9,'delete_track');
INSERT INTO "auth_permission" VALUES(28,'Can add track tutorials',10,'add_tracktutorials');
INSERT INTO "auth_permission" VALUES(29,'Can change track tutorials',10,'change_tracktutorials');
INSERT INTO "auth_permission" VALUES(30,'Can delete track tutorials',10,'delete_tracktutorials');
INSERT INTO "auth_permission" VALUES(31,'Can add quiz',11,'add_quiz');
INSERT INTO "auth_permission" VALUES(32,'Can change quiz',11,'change_quiz');
INSERT INTO "auth_permission" VALUES(33,'Can delete quiz',11,'delete_quiz');
INSERT INTO "auth_permission" VALUES(34,'Can add user social auth',12,'add_usersocialauth');
INSERT INTO "auth_permission" VALUES(35,'Can change user social auth',12,'change_usersocialauth');
INSERT INTO "auth_permission" VALUES(36,'Can delete user social auth',12,'delete_usersocialauth');
INSERT INTO "auth_permission" VALUES(37,'Can add nonce',13,'add_nonce');
INSERT INTO "auth_permission" VALUES(38,'Can change nonce',13,'change_nonce');
INSERT INTO "auth_permission" VALUES(39,'Can delete nonce',13,'delete_nonce');
INSERT INTO "auth_permission" VALUES(40,'Can add association',14,'add_association');
INSERT INTO "auth_permission" VALUES(41,'Can change association',14,'change_association');
INSERT INTO "auth_permission" VALUES(42,'Can delete association',14,'delete_association');
INSERT INTO "auth_permission" VALUES(43,'Can add code',15,'add_code');
INSERT INTO "auth_permission" VALUES(44,'Can change code',15,'change_code');
INSERT INTO "auth_permission" VALUES(45,'Can delete code',15,'delete_code');
INSERT INTO "auth_permission" VALUES(46,'Can add user',16,'add_aishackuser');
INSERT INTO "auth_permission" VALUES(47,'Can change user',16,'change_aishackuser');
INSERT INTO "auth_permission" VALUES(48,'Can delete user',16,'delete_aishackuser');
CREATE TABLE "auth_group_permissions" (
    "id" integer NOT NULL PRIMARY KEY,
    "group_id" integer NOT NULL,
    "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"),
    UNIQUE ("group_id", "permission_id")
);
CREATE TABLE "auth_group" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(80) NOT NULL UNIQUE
);
CREATE TABLE "auth_user_groups" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL,
    "group_id" integer NOT NULL REFERENCES "auth_group" ("id"),
    UNIQUE ("user_id", "group_id")
);
CREATE TABLE "auth_user_user_permissions" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL,
    "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"),
    UNIQUE ("user_id", "permission_id")
);
CREATE TABLE "auth_user" (
    "id" integer NOT NULL PRIMARY KEY,
    "password" varchar(128) NOT NULL,
    "last_login" datetime NOT NULL,
    "is_superuser" bool NOT NULL,
    "username" varchar(30) NOT NULL UNIQUE,
    "first_name" varchar(30) NOT NULL,
    "last_name" varchar(30) NOT NULL,
    "email" varchar(75) NOT NULL,
    "is_staff" bool NOT NULL,
    "is_active" bool NOT NULL,
    "date_joined" datetime NOT NULL
);
INSERT INTO "auth_user" VALUES(1,'pbkdf2_sha256$12000$eDLZzXTu28mI$ZUG21MW/w8tY1d1hUqIeT9BINdZX2i7uWiFegINz2Yc=','2014-08-03 17:31:26',1,'utkarsh','Utkarsh','Sinha','sinha.utkarsh1990@gmail.com',1,1,'2014-08-03 16:59:41');
INSERT INTO "auth_user" VALUES(2,'pbkdf2_sha256$12000$DwsQBeX2HHqy$5gDdKPIDMlV+oDKn+rn+bj6csAOffbFL1h2Ep204FPw=','2014-08-09 16:18:47',0,'shervin','','','shervin.emami@gmail.com',0,1,'2014-08-09 16:18:47');
CREATE TABLE "django_content_type" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(100) NOT NULL,
    "app_label" varchar(100) NOT NULL,
    "model" varchar(100) NOT NULL,
    UNIQUE ("app_label", "model")
);
INSERT INTO "django_content_type" VALUES(1,'log entry','admin','logentry');
INSERT INTO "django_content_type" VALUES(2,'permission','auth','permission');
INSERT INTO "django_content_type" VALUES(3,'group','auth','group');
INSERT INTO "django_content_type" VALUES(4,'user','auth','user');
INSERT INTO "django_content_type" VALUES(5,'content type','contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES(6,'session','sessions','session');
INSERT INTO "django_content_type" VALUES(7,'tutorial','aishack','tutorial');
INSERT INTO "django_content_type" VALUES(8,'category','aishack','category');
INSERT INTO "django_content_type" VALUES(9,'track','aishack','track');
INSERT INTO "django_content_type" VALUES(10,'track tutorials','aishack','tracktutorials');
INSERT INTO "django_content_type" VALUES(11,'quiz','aishack','quiz');
INSERT INTO "django_content_type" VALUES(12,'user social auth','default','usersocialauth');
INSERT INTO "django_content_type" VALUES(13,'nonce','default','nonce');
INSERT INTO "django_content_type" VALUES(14,'association','default','association');
INSERT INTO "django_content_type" VALUES(15,'code','default','code');
INSERT INTO "django_content_type" VALUES(16,'user','aishack','aishackuser');
CREATE TABLE "django_session" (
    "session_key" varchar(40) NOT NULL PRIMARY KEY,
    "session_data" text NOT NULL,
    "expire_date" datetime NOT NULL
);
INSERT INTO "django_session" VALUES('pwmvqnkrvujixi94nvjb0jdpyhjxc9li','ZGQ4YzQ3YzFiOGE0OThiNjAyN2U0NDI2MTk5YjEyMGRlNzI3MDY2NTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MSwiX21lc3NhZ2VzIjoiW1tcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlN1Y2Nlc3NmdWxseSBkZWxldGVkIDEgdHV0b3JpYWwuXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlN1Y2Nlc3NmdWxseSBkZWxldGVkIDEgdHV0b3JpYWwuXCJdXSJ9','2014-08-24 06:55:25.214832');
CREATE TABLE "social_auth_usersocialauth" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    "provider" varchar(32) NOT NULL,
    "uid" varchar(255) NOT NULL,
    "extra_data" text NOT NULL,
    UNIQUE ("provider", "uid")
);
CREATE TABLE "social_auth_nonce" (
    "id" integer NOT NULL PRIMARY KEY,
    "server_url" varchar(255) NOT NULL,
    "timestamp" integer NOT NULL,
    "salt" varchar(65) NOT NULL
);
CREATE TABLE "social_auth_association" (
    "id" integer NOT NULL PRIMARY KEY,
    "server_url" varchar(255) NOT NULL,
    "handle" varchar(255) NOT NULL,
    "secret" varchar(255) NOT NULL,
    "issued" integer NOT NULL,
    "lifetime" integer NOT NULL,
    "assoc_type" varchar(64) NOT NULL
);
CREATE TABLE "social_auth_code" (
    "id" integer NOT NULL PRIMARY KEY,
    "email" varchar(75) NOT NULL,
    "code" varchar(32) NOT NULL,
    "verified" bool NOT NULL,
    UNIQUE ("email", "code")
);
CREATE TABLE "south_migrationhistory" (
    "id" integer NOT NULL PRIMARY KEY,
    "app_name" varchar(255) NOT NULL,
    "migration" varchar(255) NOT NULL,
    "applied" datetime NOT NULL
);
INSERT INTO "south_migrationhistory" VALUES(1,'aishack','0001_initial','2014-08-03 17:04:53.017643');
INSERT INTO "south_migrationhistory" VALUES(2,'aishack','0002_auto__add_field_tutorial_author','2014-08-03 17:42:43.019685');
INSERT INTO "south_migrationhistory" VALUES(3,'aishack','0003_auto__add_field_tracktutorials_order','2014-08-04 17:19:37.145827');
INSERT INTO "south_migrationhistory" VALUES(4,'aishack','0004_auto__add_aishackuser','2014-08-09 05:55:40.589926');
INSERT INTO "south_migrationhistory" VALUES(5,'aishack','0005_auto__chg_field_aishackuser_bio','2014-08-09 06:00:24.519755');
CREATE TABLE "aishack_category" ("id" integer NOT NULL PRIMARY KEY, "title" varchar(256) NOT NULL UNIQUE, "desc" varchar(1024) NOT NULL);
INSERT INTO "aishack_category" VALUES(1,'Uncategorized','');
INSERT INTO "aishack_category" VALUES(2,'Computer vision','');
INSERT INTO "aishack_category" VALUES(3,'OpenCV','');
INSERT INTO "aishack_category" VALUES(4,'Electronics','');
INSERT INTO "aishack_category" VALUES(5,'General','');
INSERT INTO "aishack_category" VALUES(6,'Machine learning','');
CREATE TABLE "aishack_track" ("id" integer NOT NULL PRIMARY KEY, "title" varchar(256) NOT NULL UNIQUE);
CREATE TABLE "aishack_quiz" ("id" integer NOT NULL PRIMARY KEY, "title" varchar(128) NOT NULL);
CREATE TABLE "aishack_tutorial" ("title" varchar(128) NOT NULL UNIQUE, "excerpt" varchar(512) NOT NULL, "id" integer PRIMARY KEY, "content" text NOT NULL, "post_image" varchar(256) NOT NULL, "date" date NOT NULL, "author_id" integer NOT NULL, "category_id" integer NOT NULL, "slug" varchar(128) NOT NULL UNIQUE);
INSERT INTO "aishack_tutorial" VALUES('Image Moments','',1,'<p>An Image moment is a number calculated using a certain formula. Understand what that formula means might be hard at first. In fact, I got a lot of questions about moments from <a href="/tutorials/tracking-colored-objects-in-opencv">the tracking tutorial</a> I did long back. So, here it is - an explanation of what moments area! </p>
<h2>The math of moments</h2>
<p>In pure math, the n<sup>th</sup> order moment about the point c is defined as:</p>
<p><img alt="" src="http://s0.wp.com/latex.php?latex=%5Cmu_%7Bn%7D%20%3D%20%5Cint_%7B-%5Cinfty%7D%5E%7B%2B%5Cinfty%7D%20%28x-c%29%5E%7Bn%7Df%28x%29%20%5C%2Cdx&amp;bg=ffffff&amp;fg=000&amp;s=0" /></p>
<p>This definition holds for a function that has just one independent variable. We''re interested in images - they have two dimensions. So we need two independent variables. So the formula becomes:</p>
<p><img alt="" src="http://s0.wp.com/latex.php?latex=%5Cmu_%7Bm%2Cn%7D%20%3D%20%5Cint%5Cint%28x-c_x%29%5E%7Bm%7D%28y-c_y%29%5E%7Bn%7Df%28x%2C%20y%29%5C%2Cdy%5C%2Cdx&amp;bg=ffffff&amp;fg=000&amp;s=0" /></p>
<p>Here, the f(x, y) is the actual image and is assumed to be continuous. For our purposes, we need a discrete way (think pixels) to describe moments:</p>
<p><img alt="" src="http://s0.wp.com/latex.php?latex=%5Cmu_%7Bm%2Cn%7D%20%3D%20%5Csum_%7Bx%3D0%7D%5E%7B%5Cinfty%7D%5Csum_%7By%3D0%7D%5E%7B%5Cinfty%7D%28x-c_x%29%5E%7Bm%7D%28y-c_y%29%5E%7Bn%7Df%28x%2C%20y%29&amp;bg=ffffff&amp;fg=000&amp;s=0" /></p>
<p>The intergrals has been replaced by summations. The order of the moment is m + n. Usually, we calculate the moments about (0, 0). So you can simply ignore the constants c<sub>x</sub> and c<sub>y</sub>.</p>
<p>Now with the math part out of the way, let''s have a look at what you can calculate with this thing. </p>
<figure><img alt="A binary image with white and black pixels" src="/static/img/tut/zeroth-order.png" /><figcaption>
<p>A binary image with white and black pixels</p>
</figcaption>
</figure>
<h2>Calculating area</h2>
<p>To calculate the area of a binary image, you need to calculate its zeroth moment:</p>
<p><img alt="" src="http://s0.wp.com/latex.php?latex=%5Cmu_%7B0%2C0%7D%20%3D%20%5Csum_%7Bx%3D0%7D%5E%7Bw%7D%5Csum_%7By%3D0%7D%5E%7Bh%7Dx%5E%7B0%7Dy%5E%7B0%7Df%28x%2C%20y%29&amp;bg=ffffff&amp;fg=000&amp;s=0" /></p>
<p>The x<sup>0</sup> and y<sup>0</sup> don''t have any effect and can be removed.</p>
<p><img alt="" src="http://s0.wp.com/latex.php?latex=%5Cmu_%7B0%2C0%7D%20%3D%20%5Csum_%7Bx%3D0%7D%5E%7Bw%7D%5Csum_%7By%3D0%7D%5E%7Bh%7Df%28x%2C%20y%29&amp;bg=ffffff&amp;fg=000&amp;s=0" /></p>
<p>Now, in a binary image, a pixel is either 0 or 1. So for every white pixel, a ''1'' is added to the moment - effectively calculating the area of the binary image! Another thing to note is that there is only one zeroth order moment. </p>
<h2>Centroid</h2>
<p>To calculate the centroid of a binary image you need to calculate two coordinates -</p>
<p><img alt="" src="http://s0.wp.com/latex.php?latex=centroid%20%3D%20%28%5Cfrac%7B%5Cmu_%7B1%2C0%7D%7D%7B%5Cmu_%7B0%2C0%7D%7D%2C%20%5Cfrac%7B%5Cmu_%7B0%2C1%7D%7D%7B%5Cmu_%7B0%2C0%7D%7D%29&amp;bg=ffffff&amp;fg=000&amp;s=0" /></p>
<p>How did I get that? Here''s a quick explanation. Consider the first moment:</p>
<p><img alt="" src="http://s0.wp.com/latex.php?latex=sum_x%20%3D%20%5Csum%5Csum%20x%20f%28x%2C%20y%29&amp;bg=ffffff&amp;fg=000&amp;s=0" /></p>
<p>The two summations are like a <em>for</em> loop. The x coordinate of all white pixels (where f(x, y) = 1) is added up.</p>
<p>Similarly, we can calculate the sum of y coordinates of all white pixels: </p>
<p><img alt="" src="http://s0.wp.com/latex.php?latex=sum_y%20%3D%20%5Csum%5Csum%20y%20f%28x%2C%20y%29&amp;bg=ffffff&amp;fg=000&amp;s=0" /></p>
<p>Now we have the sum of several pixels'' x and y coordinates. To get the average, you need to divide each by the number of pixels. The number of pixels is the area of the image - the zeroth moment. So you get:</p>
<p><img alt="" src="http://s0.wp.com/latex.php?latex=%5Cmu_%7B1%2C0%7D%20%3D%20%5Cfrac%7Bsum_x%7D%7B%5Cmu_%7B0%2C0%7D%7D&amp;bg=ffffff&amp;fg=000&amp;s=0" /> and <img alt="" src="http://s0.wp.com/latex.php?latex=%5Cmu_%7B0%2C1%7D%20%3D%20%5Cfrac%7Bsum_y%7D%7B%5Cmu_%7B0%2C0%7D%7D&amp;bg=ffffff&amp;fg=000&amp;s=0" /></p>
<p>One interesting thing about this technique is that it is not very sensitive to noise. The centroid might move a little bit but not much.</p>
<p>Also, from the math it''s clear this technique holds only for single blobs. If you have two white blobs in your image, the centroid will be somewhere in between. You''ll have to extract each blob separately to get their centroids. </p>
<figure><img alt="Calculating the centroid" src="/static/img/tut/first-order.png" /><figcaption>
<p>Calculating the centroid of this blob</p>
</figcaption>
</figure>
<h2>Central moments</h2>
<p>In fact, this kind of division is very common - dividing a moment by the zeroth order moment. It''s so common that it has a name of its own - central moments.</p>
<p>So to calculate the centroid, you need to calculate the first order central moments. </p>
<h2>Higher order moments</h2>
<p>Going onto higher order moments, things get complicated really fast. You have  three 2<sup>nd</sup> order moments, four 3<sup>rd</sup> order moments, etc. You can combine several of these  moments so that they are translation invariant, scale invariant and even rotation invariant.</p>
<p>While reading about moments, I found an entire book dedicated to <a href="http://www.amazon.com/gp/product/0470699876/ref=as_li_ss_tl?ie=UTF8&amp;tag=aish04-20&amp;linkCode=as2&amp;camp=217145&amp;creative=399373&amp;creativeASIN=0470699876">pattern recognition with moments</a><img alt="" src="http://www.assoc-amazon.com/e/ir?t=&amp;l=as2&amp;o=1&amp;a=0470699876&amp;camp=217145&amp;creative=399373" />. In fact, there are terms called <em>skewness</em> and <em>kurtosis</em>. These refer to third and fourth order moments. They measure how skewed an image is and whether an image is tall and thin or short and fat. Clearly, there''s a LOT that can be learned about these mathematical tools.</p>','/static/img/tut/post-image-moments.png','2011-06-21',1,3,'image-moments');
INSERT INTO "aishack_tutorial" VALUES('The Canny Edge Detector','',2,'<p>A lot of people consider the Canny Edge Detector the ultimate edge detector. You get clean, thin edges that are well connected to nearby edges. If you use some image processing package, you probably get a function that does everything. Here, I''ll go into exactly how they work. </p>
<h2>Overview</h2>
<p>The canny edge detector is a multistage edge detection algorithm. The steps are: </p>
<ol>
<li>Preprocessing</li>
<li>Calculating gradients</li>
<li>Nonmaximum suppression</li>
<li>Thresholding with hysterysis</li>
</ol>
<p>The two key parameters of the algorithm are - an upper threshold and a lower threshold. The upper threshold is used to mark edges that are definitely edges. The lower threshold is to find faint pixels that are actually a part of an edge. </p>
<h2>Preprocessing</h2>
<p>Edge detectors are are prone to noise. A bit of smoothing with a Gaussian blur helps. From what I''ve seen, software packages don''t do this step automatically, you need to do this yourself.</p>
<p>Usually, a 5x5 Gaussian filter with standard deviation = 1.4 is used for this purpose. </p>
<h2>Calculating gradients</h2>
<p>Next, gradient magnitudes and directions are calculated at every single point in the image. The <em>magnitude</em> of the gradient at a point determines if it possibly lies on an edge or not. A high gradient magnitude means the colors are changing rapidly - implying an edge. A low gradient implies no substantial changes. So it''s not am edge.</p>
<p>The <em>direction</em> of the gradient shows how the edge is oriented.</p>
<p>To calculate these, <a href="/tutorials/the-sobel-and-laplacian-edge-detectors/">the standard sobel edge detector</a> is used.</p>
<p>The magnitude of gradient is <img alt="" src="http://s0.wp.com/latex.php?latex=m%20%3D%20%5Csqrt%7BG_x%5E2%20%2B%20G_y%5E2%7D&amp;bg=ffffff&amp;fg=000&amp;s=0" />. The direction of gradient is <img alt="" src="http://s0.wp.com/latex.php?latex=%5Ctheta%20%3D%20arctan%28%5Cfrac%7BG_y%7D%7BG_x%7D%29&amp;bg=ffffff&amp;fg=000&amp;s=0" />. Here, <img alt="" src="http://s0.wp.com/latex.php?latex=G_x&amp;bg=ffffff&amp;fg=000&amp;s=0" /> and <img alt="" src="http://s0.wp.com/latex.php?latex=G_y&amp;bg=ffffff&amp;fg=000&amp;s=0" /> are the X and Y derivatives at the point being considered.</p>
<p>Once we have the gradient magnitudes and orientations, we can get started with the actual edge detection.</p>
<h2>Nonmaximum supression</h2>
<p>This step does exactly what it means - if a pixel is not a maximum, it is suppressed. To do this, you iterate over all pixels. The orientation of each pixel is put into one of the four bins. Why? Have a look at this:</p>
<figure><img alt="The neighbors while computing canny edges" src="/static/img/tut/possible-neighbors.jpg" />  <figcaption>
<p>Possible directions of an edge  </p>
</figcaption>
</figure>
<p>Let''s say you''re at the grey pixel. There are only four possible edges possible - it could either go from north to south (the green neighbors), from east to west (the blue ones) or one of the diagonals (the yellow or red neighbors). So using the current pixel''s gradient direction, you try and estimate where the edge is going. </p>
<p><span class="tut-warn">Most computer vision packages do not use the coordinate system you use in your geometry class - The X axis increases from left to right (the usual way) but the Y axis increases from top to down (the opposite way). So slope directions change.</span></p>
<p>The four possibilities need to be treated separately to check for nonmaximum suppression. I''ll explain one possibility in detail. The others are the same, with minor differences. </p>
<h3>Gradient orientation from 22.5 to 67.5 degrees</h3>
<p><img alt="The edge is the gradient direction is from 22.5 to 67.5 degrees" src="/static/img/tut/edge-direction-451.jpg" />If the gradient orientation is in this range means change is occurring in this direction - from the top left corner to the bottom right corner. This means the edge lies from the top right corner to bottom left (the red line).</p>
<p>To check if the central red pixel belongs to an edge, you need to check if the gradient is maximum at this point. You do this by comparing its magnitude with the top left pixel and the bottom right pixel. </p>
<p>If it is maximum _and _its magnitude is greater than the upper threshold, you mark this pixel as an edge.</p>
<p>Think about it for a moment. It makes perfect sense intuitively.</p>
<p><span class="tut-success">An edge is always perpendicular to the gradient direction. Intensities do not change along an edge - they change <em>across</em> the edge.</span></p>
<h3>Other gradient orientations</h3>
<p>Other gradient directions are handled similarly: </p>
<ul>
<li>67.5 to 112.5 degrees: The gradient is from top to bottom. This means the edge is from left to right. So you check gradient magnitudes against the pixels right above and below.</li>
<li>112.5 to 157.5 degrees: The gradient is the other diagonal.</li>
<li>0-22.5 or 157.5-180 degrees: The gradient is horizontal. So the edge is vertical. So you check the pixels to the left and right.</li>
</ul>
<figure><img alt="" src="/static/img/tut/edge-direction-all.jpg" />  <figcaption>
<p>The three remaining cases: The edge is marked by red and the central pixel is compared to the dark pixels  </p>
</figcaption>
</figure>
<p>After nonmaximum suppression, you''ll get something called ''thin edges''. This might be broken at various points. We''ll fix this by filling in gaps with another threshold (with hysteresis). </p>
<h2>Thresholding with Hysterysis</h2>
<p>In the previous step, we marked pixels that had a gradient magnitude greater than the upper threshold. Now using the direction information and the lower threshold, we''ll "grow" these edges.</p>
<p>Here''s the idea: </p>
<ul>
<li>If the current pixel is not an edge, check the next one.</li>
<li>If it is an edge, check the two pixels in the direction of the edge (ie, perpendicular to the gradient direction). If either of them (or both) <ul>
<li>Have the direction in the same bin as the central pixel</li>
<li>Gradient magnitude is greater than the lower threshold</li>
<li>They are the maximum compared to their neighbors (nonmaximum suppression for these pixels), then you can mark these pixels as an edge pixel</li>
</ul>
</li>
<li>Loop until there are no changes in the image
Once the image stops changing, you''ve got your canny edges! That''s it! You''re done!</li>
</ul>','/static/img/tut/canny-edge-detector.jpg','2011-06-28',1,2,'the-canny-edge-detector');
INSERT INTO "aishack_tutorial" VALUES('Implementing Canny Edges from scratch','',3,'<p>Here''s an interesting article - we''ll implement canny edges. We won''t use any prepackaged functions. I''ll be using OpenCV for this article, but I''m sure translating it to some other computer vision package won''t be difficult.</p>
<p><span class="tut-warn">I assume you know how the algorithm works. If not, read up about <a href="/tutorials/the-canny-edge-detector/">the Canny edge detection algorithm</a>!</span></p>
<h2>Getting Started</h2>
<p>We''ll start off with the function definition: </p>
<div class="codehilite"><pre><span class="n">Mat</span> <span class="nf">MyCanny</span><span class="p">(</span><span class="n">Mat</span> <span class="n">src</span><span class="p">,</span> <span class="kt">int</span> <span class="n">upperThreshold</span><span class="p">,</span> <span class="kt">int</span> <span class="n">lowerThreshold</span><span class="p">,</span> <span class="kt">double</span> <span class="n">size</span> <span class="o">=</span> <span class="mi">3</span><span class="p">)</span>
<span class="p">{</span>
</pre></div>


<p>We send in an image, specify the upper and lower threshold and specify the accuracy of the sobel edge detection with the size parameter (it is the size of the kernel used in sobel).</p>
<p>For this article, I won''t be considering error checking and other unrelated things (checking image depth, channels, etc). I assume <em>src</em> has one channel (it''s grayscale) and is in the CV_8UC1 format (each pixel is a single byte). </p>
<h2>Preprocessing</h2>
<p>If you want, you can put a Gaussian blur before you even start any work. Or you could simply clone <em>src</em>. </p>
<div class="codehilite"><pre>    <span class="n">Mat</span> <span class="n">workImg</span> <span class="o">=</span> <span class="n">Mat</span><span class="p">(</span><span class="n">src</span><span class="p">);</span>

    <span class="n">workImg</span> <span class="o">=</span> <span class="n">src</span><span class="p">.</span><span class="n">clone</span><span class="p">();</span>

    <span class="c1">// Step 1: Noise reduction</span>
    <span class="n">cv</span><span class="o">::</span><span class="n">GaussianBlur</span><span class="p">(</span><span class="n">src</span><span class="p">,</span> <span class="n">workImg</span><span class="p">,</span> <span class="n">cv</span><span class="o">::</span><span class="n">Size</span><span class="p">(</span><span class="mi">5</span><span class="p">,</span> <span class="mi">5</span><span class="p">),</span> <span class="mf">1.4</span><span class="p">);</span>
</pre></div>


<h2>Calculating gradients</h2>
<p>Next, we''ll calculate gradient magnitudes and orientations separately. We start with calculating the sobel of the image: </p>
<div class="codehilite"><pre>    <span class="c1">// Step 2: Calculating gradient magnitudes and directions</span>
    <span class="n">Mat</span> <span class="n">magX</span> <span class="o">=</span> <span class="n">Mat</span><span class="p">(</span><span class="n">src</span><span class="p">.</span><span class="n">rows</span><span class="p">,</span> <span class="n">src</span><span class="p">.</span><span class="n">cols</span><span class="p">,</span> <span class="n">CV_32F</span><span class="p">);</span>
    <span class="n">Mat</span> <span class="n">magY</span> <span class="o">=</span> <span class="n">Mat</span><span class="p">(</span><span class="n">src</span><span class="p">.</span><span class="n">rows</span><span class="p">,</span> <span class="n">src</span><span class="p">.</span><span class="n">cols</span><span class="p">,</span> <span class="n">CV_32F</span><span class="p">);</span>
    <span class="n">cv</span><span class="o">::</span><span class="n">Sobel</span><span class="p">(</span><span class="n">workImg</span><span class="p">,</span> <span class="n">magX</span><span class="p">,</span> <span class="n">CV_32F</span><span class="p">,</span> <span class="mi">1</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="n">size</span><span class="p">);</span>
    <span class="n">cv</span><span class="o">::</span><span class="n">Sobel</span><span class="p">(</span><span class="n">workImg</span><span class="p">,</span> <span class="n">magY</span><span class="p">,</span> <span class="n">CV_32F</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">1</span><span class="p">,</span> <span class="n">size</span><span class="p">);</span>
</pre></div>


<p>next, we calculate the slope at each point. This is simply dividing the Y derivative by X: </p>
<div class="codehilite"><pre>    <span class="n">Mat</span> <span class="n">direction</span> <span class="o">=</span> <span class="n">Mat</span><span class="p">(</span><span class="n">workImg</span><span class="p">.</span><span class="n">rows</span><span class="p">,</span> <span class="n">workImg</span><span class="p">.</span><span class="n">cols</span><span class="p">,</span> <span class="n">CV_32F</span><span class="p">);</span>
    <span class="n">cv</span><span class="o">::</span><span class="n">divide</span><span class="p">(</span><span class="n">magY</span><span class="p">,</span> <span class="n">magX</span><span class="p">,</span> <span class="n">direction</span><span class="p">);</span>
</pre></div>


<p>Next we calculate the magnitude of the gradient at each pixel: </p>
<div class="codehilite"><pre>    <span class="n">Mat</span> <span class="n">sum</span> <span class="o">=</span> <span class="n">Mat</span><span class="p">(</span><span class="n">workImg</span><span class="p">.</span><span class="n">rows</span><span class="p">,</span> <span class="n">workImg</span><span class="p">.</span><span class="n">cols</span><span class="p">,</span> <span class="n">CV_64F</span><span class="p">);</span>
    <span class="n">Mat</span> <span class="n">prodX</span> <span class="o">=</span> <span class="n">Mat</span><span class="p">(</span><span class="n">workImg</span><span class="p">.</span><span class="n">rows</span><span class="p">,</span> <span class="n">workImg</span><span class="p">.</span><span class="n">cols</span><span class="p">,</span> <span class="n">CV_64F</span><span class="p">);</span>
    <span class="n">Mat</span> <span class="n">prodY</span> <span class="o">=</span> <span class="n">Mat</span><span class="p">(</span><span class="n">workImg</span><span class="p">.</span><span class="n">rows</span><span class="p">,</span> <span class="n">workImg</span><span class="p">.</span><span class="n">cols</span><span class="p">,</span> <span class="n">CV_64F</span><span class="p">);</span>
    <span class="n">cv</span><span class="o">::</span><span class="n">multiply</span><span class="p">(</span><span class="n">magX</span><span class="p">,</span> <span class="n">magX</span><span class="p">,</span> <span class="n">prodX</span><span class="p">);</span>
    <span class="n">cv</span><span class="o">::</span><span class="n">multiply</span><span class="p">(</span><span class="n">magY</span><span class="p">,</span> <span class="n">magY</span><span class="p">,</span> <span class="n">prodY</span><span class="p">);</span>
    <span class="n">sum</span> <span class="o">=</span> <span class="n">prodX</span> <span class="o">+</span> <span class="n">prodY</span><span class="p">;</span>
    <span class="n">cv</span><span class="o">::</span><span class="n">sqrt</span><span class="p">(</span><span class="n">sum</span><span class="p">,</span> <span class="n">sum</span><span class="p">);</span>
</pre></div>


<p>We''re calculating <img alt="" src="http://s0.wp.com/latex.php?latex=%5Csqrt%7BG_x%5E2%20%2B%20G_y%5E2%7D&amp;bg=ffffff&amp;fg=000&amp;s=0" /> for every point. Simple stuff. </p>
<h2>Nonmaximum suppression</h2>
<p>We need to figure out points that definitely lie on edges - points whose gradient magnitude is greater than upper threshold and are a maxima.</p>
<p>We''ll start by initializing a few things: </p>
<div class="codehilite"><pre>    <span class="n">Mat</span> <span class="n">returnImg</span> <span class="o">=</span> <span class="n">Mat</span><span class="p">(</span><span class="n">src</span><span class="p">.</span><span class="n">rows</span><span class="p">,</span> <span class="n">src</span><span class="p">.</span><span class="n">cols</span><span class="p">,</span> <span class="n">CV_8U</span><span class="p">);</span>

    <span class="n">returnImg</span><span class="p">.</span><span class="n">setTo</span><span class="p">(</span><span class="n">cv</span><span class="o">::</span><span class="n">Scalar</span><span class="p">(</span><span class="mi">0</span><span class="p">));</span>         <span class="c1">// Initialie image to return to zero</span>

    <span class="c1">// Initialize iterators</span>
    <span class="n">cv</span><span class="o">::</span><span class="n">MatIterator_</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="n">itMag</span> <span class="o">=</span> <span class="n">sum</span><span class="p">.</span><span class="n">begin</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">();</span>
    <span class="n">cv</span><span class="o">::</span><span class="n">MatIterator_</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="n">itDirection</span> <span class="o">=</span> <span class="n">direction</span><span class="p">.</span><span class="n">begin</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">();</span>

    <span class="n">cv</span><span class="o">::</span><span class="n">MatIterator_</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="n">itRet</span> <span class="o">=</span> <span class="n">returnImg</span><span class="p">.</span><span class="n">begin</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="p">();</span>

    <span class="n">cv</span><span class="o">::</span><span class="n">MatIterator_</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="n">itend</span> <span class="o">=</span> <span class="n">sum</span><span class="p">.</span><span class="n">end</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">();</span>
</pre></div>


<p><em>returnImg</em> is the image that will have all canny edges. We''ve initialized all iterators for the magnitude, direction and return images.</p>
<p>Now, we start going through each pixel: </p>
<div class="codehilite"><pre>    <span class="k">for</span><span class="p">(;</span><span class="n">itMag</span><span class="o">!=</span><span class="n">itend</span><span class="p">;</span><span class="o">++</span><span class="n">itDirection</span><span class="p">,</span> <span class="o">++</span><span class="n">itRet</span><span class="p">,</span> <span class="o">++</span><span class="n">itMag</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="k">const</span> <span class="n">cv</span><span class="o">::</span><span class="n">Point</span> <span class="n">pos</span> <span class="o">=</span> <span class="n">itRet</span><span class="p">.</span><span class="n">pos</span><span class="p">();</span>

        <span class="kt">float</span> <span class="n">currentDirection</span> <span class="o">=</span> <span class="n">atan</span><span class="p">(</span><span class="o">*</span><span class="n">itDirection</span><span class="p">)</span> <span class="o">*</span> <span class="mi">180</span> <span class="o">/</span> <span class="mf">3.142</span><span class="p">;</span>

        <span class="k">while</span><span class="p">(</span><span class="n">currentDirection</span><span class="o">&lt;</span><span class="mi">0</span><span class="p">)</span> <span class="n">currentDirection</span><span class="o">+=</span><span class="mi">180</span><span class="p">;</span>

        <span class="o">*</span><span class="n">itDirection</span> <span class="o">=</span> <span class="n">currentDirection</span><span class="p">;</span>

        <span class="k">if</span><span class="p">(</span><span class="o">*</span><span class="n">itMag</span><span class="o">&lt;</span><span class="n">upperThreshold</span><span class="p">)</span> <span class="k">continue</span><span class="p">;</span>
</pre></div>


<p>We store the current pixel in <em>pos</em>. Calculate the gradient direction in terms of degrees (and make it positive) and store it back. Then, if the pixel''s gradient magnitude is not high enough, we simple skip it. Now add this line: </p>
<div class="codehilite"><pre>        <span class="kt">bool</span> <span class="n">flag</span> <span class="o">=</span> <span class="nb">true</span><span class="p">;</span>
</pre></div>


<p>This boolean variables indicates if the current pixel is an edge or not. At the end, if it passes all tests, it will still be true and we mark the pixel as an edge. Next, we consider each bin of the direction: </p>
<div class="codehilite"><pre>        <span class="k">if</span><span class="p">(</span><span class="n">currentDirection</span><span class="o">&gt;</span><span class="mf">112.5</span> <span class="o">&amp;&amp;</span> <span class="n">currentDirection</span> <span class="o">&lt;=</span><span class="mf">157.5</span><span class="p">)</span>
        <span class="p">{</span>
            <span class="k">if</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">&gt;</span><span class="mi">0</span> <span class="o">&amp;&amp;</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">&lt;</span><span class="n">workImg</span><span class="p">.</span><span class="n">cols</span><span class="o">-</span><span class="mi">1</span> <span class="o">&amp;&amp;</span> <span class="o">*</span><span class="n">itMag</span><span class="o">&lt;=</span><span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">))</span> <span class="n">flag</span> <span class="o">=</span> <span class="nb">false</span><span class="p">;</span>
            <span class="k">if</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">&lt;</span><span class="n">workImg</span><span class="p">.</span><span class="n">rows</span><span class="o">-</span><span class="mi">1</span> <span class="o">&amp;&amp;</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">&gt;</span><span class="mi">0</span> <span class="o">&amp;&amp;</span> <span class="o">*</span><span class="n">itMag</span><span class="o">&lt;=</span><span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">))</span> <span class="n">flag</span> <span class="o">=</span> <span class="nb">false</span><span class="p">;</span>
        <span class="p">}</span>
</pre></div>


<p>If the gradient direction is between 112.5 and 157.5 degrees, then it is rounded off to 135 degrees. This means, the edge is from top left to bottom right. So you need to check the top right and bottom left pixels for the maxima condition - these are (x+1, y-1) and (x-1, y+1). This is done with the <em>sum.at</em> call. The extra if''s ensure you don''t go out of bounds. If the magnitude is lower than the neighbours, flag is set to false.</p>
<p>We do similar things with the other bins: </p>
<div class="codehilite"><pre>        <span class="k">else</span> <span class="nf">if</span><span class="p">(</span><span class="n">currentDirection</span><span class="o">&gt;</span><span class="mf">67.5</span> <span class="o">&amp;&amp;</span> <span class="n">currentDirection</span> <span class="o">&lt;=</span> <span class="mf">112.5</span><span class="p">)</span>
        <span class="p">{</span>
            <span class="k">if</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">&gt;</span><span class="mi">0</span> <span class="o">&amp;&amp;</span> <span class="o">*</span><span class="n">itMag</span><span class="o">&lt;=</span><span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="p">))</span> <span class="n">flag</span> <span class="o">=</span> <span class="nb">false</span><span class="p">;</span>
            <span class="k">if</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">&lt;</span><span class="n">workImg</span><span class="p">.</span><span class="n">rows</span><span class="o">-</span><span class="mi">1</span> <span class="o">&amp;&amp;</span> <span class="o">*</span><span class="n">itMag</span><span class="o">&lt;=</span><span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="p">))</span> <span class="n">flag</span> <span class="o">=</span> <span class="nb">false</span><span class="p">;</span>
        <span class="p">}</span>
        <span class="k">else</span> <span class="nf">if</span><span class="p">(</span><span class="n">currentDirection</span> <span class="o">&gt;</span> <span class="mf">22.5</span> <span class="o">&amp;&amp;</span> <span class="n">currentDirection</span> <span class="o">&lt;=</span> <span class="mf">67.5</span><span class="p">)</span>
        <span class="p">{</span>
            <span class="k">if</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">&gt;</span><span class="mi">0</span> <span class="o">&amp;&amp;</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">&gt;</span><span class="mi">0</span> <span class="o">&amp;&amp;</span> <span class="o">*</span><span class="n">itMag</span><span class="o">&lt;=</span><span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">))</span> <span class="n">flag</span> <span class="o">=</span> <span class="nb">false</span><span class="p">;</span>
            <span class="k">if</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">&lt;</span><span class="n">workImg</span><span class="p">.</span><span class="n">rows</span><span class="o">-</span><span class="mi">1</span> <span class="o">&amp;&amp;</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">&lt;</span><span class="n">workImg</span><span class="p">.</span><span class="n">cols</span><span class="o">-</span><span class="mi">1</span> <span class="o">&amp;&amp;</span> <span class="o">*</span><span class="n">itMag</span><span class="o">&lt;=</span><span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">))</span> <span class="n">flag</span> <span class="o">=</span> <span class="nb">false</span><span class="p">;</span>
        <span class="p">}</span>
        <span class="k">else</span>
        <span class="p">{</span>
            <span class="k">if</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">&gt;</span><span class="mi">0</span> <span class="o">&amp;&amp;</span> <span class="o">*</span><span class="n">itMag</span><span class="o">&lt;=</span><span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">))</span> <span class="n">flag</span> <span class="o">=</span> <span class="nb">false</span><span class="p">;</span>
            <span class="k">if</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">&lt;</span><span class="n">workImg</span><span class="p">.</span><span class="n">cols</span><span class="o">-</span><span class="mi">1</span> <span class="o">&amp;&amp;</span> <span class="o">*</span><span class="n">itMag</span><span class="o">&lt;=</span><span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">))</span> <span class="n">flag</span> <span class="o">=</span> <span class="nb">false</span><span class="p">;</span>
        <span class="p">}</span>
</pre></div>


<p>After this if-else ladder, we know if the current pixel is a definite edge or not. <em>flag</em> indicates this. And based on this, we mark the pixel as white in the return image: </p>
<div class="codehilite"><pre>        <span class="k">if</span><span class="p">(</span><span class="n">flag</span><span class="p">)</span>
        <span class="p">{</span>
            <span class="o">*</span><span class="n">itRet</span> <span class="o">=</span> <span class="mi">255</span><span class="p">;</span>
        <span class="p">}</span>
    <span class="p">}</span>
</pre></div>


<p>This completes the loop for step 3.</p>
<p>Now we move onto the tricky part of the algorithm. </p>
<h2>Thresholding with hysteresis</h2>
<p>We keep a flag to indicate if the image was changed in the previous iteration or not. If it was, we need to check again. If not, we''ve got our final image. </p>
<div class="codehilite"><pre>    <span class="c1">// Step 4: Hysterysis threshold</span>
    <span class="kt">bool</span> <span class="n">imageChanged</span> <span class="o">=</span> <span class="nb">true</span><span class="p">;</span>
    <span class="kt">int</span> <span class="n">i</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span>
    <span class="k">while</span><span class="p">(</span><span class="n">imageChanged</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="n">imageChanged</span> <span class="o">=</span> <span class="nb">false</span><span class="p">;</span>
        <span class="n">printf</span><span class="p">(</span><span class="s">&quot;Iteration %d\</span>
<span class="s">&quot;</span><span class="p">,</span> <span class="n">i</span><span class="p">);</span>
        <span class="n">i</span><span class="o">++</span><span class="p">;</span>
</pre></div>


<p>At the beginning of the loop, we set <em>imageChanged</em> to false. If new edge pixels are found, this will be changed to true. Next, we initialize iterators again: </p>
<div class="codehilite"><pre>        <span class="n">itMag</span> <span class="o">=</span> <span class="n">sum</span><span class="p">.</span><span class="n">begin</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">();</span>
        <span class="n">itDirection</span> <span class="o">=</span> <span class="n">direction</span><span class="p">.</span><span class="n">begin</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">();</span>
        <span class="n">itRet</span> <span class="o">=</span> <span class="n">returnImg</span><span class="p">.</span><span class="n">begin</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="p">();</span>
        <span class="n">itend</span> <span class="o">=</span> <span class="n">sum</span><span class="p">.</span><span class="n">end</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">();</span>
        <span class="k">for</span><span class="p">(;</span><span class="n">itMag</span><span class="o">!=</span><span class="n">itend</span><span class="p">;</span><span class="o">++</span><span class="n">itMag</span><span class="p">,</span> <span class="o">++</span><span class="n">itDirection</span><span class="p">,</span> <span class="o">++</span><span class="n">itRet</span><span class="p">)</span>
        <span class="p">{</span>
</pre></div>


<p>Next, extract the current pixel''s gradient direction and position: </p>
<div class="codehilite"><pre>            <span class="n">cv</span><span class="o">::</span><span class="n">Point</span> <span class="n">pos</span> <span class="o">=</span> <span class="n">itRet</span><span class="p">.</span><span class="n">pos</span><span class="p">();</span>
            <span class="k">if</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">&lt;</span><span class="mi">2</span> <span class="o">||</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">&gt;</span><span class="n">src</span><span class="p">.</span><span class="n">cols</span><span class="o">-</span><span class="mi">2</span> <span class="o">||</span> <span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">&lt;</span><span class="mi">2</span> <span class="o">||</span> <span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">&gt;</span><span class="n">src</span><span class="p">.</span><span class="n">rows</span><span class="o">-</span><span class="mi">2</span><span class="p">)</span>
                <span class="k">continue</span><span class="p">;</span>
            <span class="kt">float</span> <span class="n">currentDirection</span> <span class="o">=</span> <span class="o">*</span><span class="n">itDirection</span><span class="p">;</span>
</pre></div>


<p>If we''ve near the edges, we skip those pixels. A convention we''re using for this part is - a pixel with intensity 255 means a ''fresh'' edge pixel. It''s neighbors have not been checked. After they''ve been checked, their intensity is changed to 64. Both numbers are arbitrary. I could have selected 178 instead of 64 as well. </p>
<div class="codehilite"><pre>            <span class="c1">// Do we have a pixel we already know as an edge?</span>
            <span class="k">if</span><span class="p">(</span><span class="o">*</span><span class="n">itRet</span><span class="o">==</span><span class="mi">255</span><span class="p">)</span>
            <span class="p">{</span>
                <span class="o">*</span><span class="n">itRet</span><span class="o">=</span><span class="p">(</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="p">)</span><span class="mi">64</span><span class="p">;</span>
</pre></div>


<p>If a pixel is 255, we change it to a 64 first. Then we check the directions and process them like this: </p>
<div class="codehilite"><pre>                <span class="k">if</span><span class="p">(</span><span class="n">currentDirection</span><span class="o">&gt;</span><span class="mf">112.5</span> <span class="o">&amp;&amp;</span> <span class="n">currentDirection</span> <span class="o">&lt;=</span> <span class="mf">157.5</span><span class="p">)</span>
                <span class="p">{</span>
                    <span class="k">if</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">&gt;</span><span class="mi">0</span> <span class="o">&amp;&amp;</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">&gt;</span><span class="mi">0</span><span class="p">)</span>
                    <span class="p">{</span>
                        <span class="k">if</span><span class="p">(</span><span class="n">lowerThreshold</span><span class="o">&lt;=</span><span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span> <span class="o">&amp;&amp;</span>
                        <span class="n">returnImg</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span><span class="o">!=</span><span class="mi">64</span> <span class="o">&amp;&amp;</span>
                        <span class="n">direction</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span> <span class="o">&gt;</span> <span class="mf">112.5</span> <span class="o">&amp;&amp;</span>
                        <span class="n">direction</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span> <span class="o">&lt;=</span> <span class="mf">157.5</span> <span class="o">&amp;&amp;</span>
                        <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span> <span class="o">&gt;</span> <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">2</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="p">)</span> <span class="o">&amp;&amp;</span>
                        <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span> <span class="o">&gt;</span> <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">2</span><span class="p">))</span>
                        <span class="p">{</span>
                            <span class="n">returnImg</span><span class="p">.</span><span class="n">ptr</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)[</span><span class="mi">0</span><span class="p">]</span> <span class="o">=</span> <span class="mi">255</span><span class="p">;</span>
                            <span class="n">imageChanged</span> <span class="o">=</span> <span class="nb">true</span><span class="p">;</span>
                        <span class="p">}</span>
                    <span class="p">}</span>
                    <span class="k">if</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">&lt;</span><span class="n">workImg</span><span class="p">.</span><span class="n">rows</span><span class="o">-</span><span class="mi">1</span> <span class="o">&amp;&amp;</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">&lt;</span><span class="n">workImg</span><span class="p">.</span><span class="n">cols</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span>
                    <span class="p">{</span>
                        <span class="k">if</span><span class="p">(</span><span class="n">lowerThreshold</span><span class="o">&lt;=</span><span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">cv</span><span class="o">::</span><span class="n">Point</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">))</span> <span class="o">&amp;&amp;</span>
                        <span class="n">returnImg</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">)</span><span class="o">!=</span><span class="mi">64</span> <span class="o">&amp;&amp;</span>
                        <span class="n">direction</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">)</span> <span class="o">&gt;</span> <span class="mf">112.5</span> <span class="o">&amp;&amp;</span>
                        <span class="n">direction</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">)</span> <span class="o">&lt;=</span> <span class="mf">157.5</span> <span class="o">&amp;&amp;</span>
                        <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span> <span class="o">&gt;</span> <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">2</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="p">)</span> <span class="o">&amp;&amp;</span>
                        <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span> <span class="o">&gt;</span> <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">2</span><span class="p">))</span>
                        <span class="p">{</span>
                            <span class="n">returnImg</span><span class="p">.</span><span class="n">ptr</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">)[</span><span class="mi">0</span><span class="p">]</span> <span class="o">=</span> <span class="mi">255</span><span class="p">;</span>
                            <span class="n">imageChanged</span> <span class="o">=</span> <span class="nb">true</span><span class="p">;</span>
                        <span class="p">}</span>
                    <span class="p">}</span>
                <span class="p">}</span>
</pre></div>


<p>That''s a big piece of code! Let me explain what it does.</p>
<p>If the current pixel''s direction is between 112.5 and 157.5 (around 135). So the edge is from the top left to the bottom right. So you check if the pixels (x-1, y-1) and (x+1, y+1) are edge pixels or not. You do this by checking: </p>
<ul>
<li>The gradient magnitude at these points is greater than the lower threshold</li>
<li>If that pixel hasn''t already been checked (marked as 64)</li>
<li>The direction at that pixel falls in the same bin (112.5 to 157.5)</li>
<li>The condition used in nonmaximum suppression still holds <ul>
<li>For (x-1, y-1) this means checking against (x, y-2) and (x-2, y)</li>
<li>For (x+1, y+1) this means checking against the (x, y+2) and (x+2, y)</li>
</ul>
</li>
</ul>
<p>If all these conditions hold, you mark the neighbour with a 255. This is a fresh edge pixel. And we also change <em>imageChanged</em> to true.</p>
<p>We do a similar processing for the other three bins as well: </p>
<div class="codehilite"><pre>                <span class="k">else</span> <span class="nf">if</span><span class="p">(</span><span class="n">currentDirection</span><span class="o">&gt;</span><span class="mf">67.5</span> <span class="o">&amp;&amp;</span> <span class="n">currentDirection</span> <span class="o">&lt;=</span> <span class="mf">112.5</span><span class="p">)</span>
                <span class="p">{</span>
                    <span class="k">if</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">&gt;</span><span class="mi">0</span><span class="p">)</span>
                    <span class="p">{</span>
                        <span class="k">if</span><span class="p">(</span><span class="n">lowerThreshold</span><span class="o">&lt;=</span><span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">cv</span><span class="o">::</span><span class="n">Point</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="p">))</span> <span class="o">&amp;&amp;</span>
                        <span class="n">returnImg</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span><span class="o">!=</span><span class="mi">64</span> <span class="o">&amp;&amp;</span>
                        <span class="n">direction</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span> <span class="o">&gt;</span> <span class="mf">67.5</span> <span class="o">&amp;&amp;</span>
                        <span class="n">direction</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span> <span class="o">&lt;=</span> <span class="mf">112.5</span> <span class="o">&amp;&amp;</span>
                        <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span> <span class="o">&gt;</span> <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span> <span class="o">&amp;&amp;</span>
                        <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span> <span class="o">&gt;</span> <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">))</span>
                        <span class="p">{</span>
                            <span class="n">returnImg</span><span class="p">.</span><span class="n">ptr</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)[</span><span class="mi">0</span><span class="p">]</span> <span class="o">=</span> <span class="mi">255</span><span class="p">;</span>
                            <span class="n">imageChanged</span> <span class="o">=</span> <span class="nb">true</span><span class="p">;</span>
                        <span class="p">}</span>
                    <span class="p">}</span>
                    <span class="k">if</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">&lt;</span><span class="n">workImg</span><span class="p">.</span><span class="n">cols</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span>
                    <span class="p">{</span>
                        <span class="k">if</span><span class="p">(</span><span class="n">lowerThreshold</span><span class="o">&lt;=</span><span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">cv</span><span class="o">::</span><span class="n">Point</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="p">))</span> <span class="o">&amp;&amp;</span>
                        <span class="n">returnImg</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">)</span><span class="o">!=</span><span class="mi">64</span> <span class="o">&amp;&amp;</span>
                        <span class="n">direction</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">)</span> <span class="o">&gt;</span> <span class="mf">67.5</span> <span class="o">&amp;&amp;</span>
                        <span class="n">direction</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">)</span> <span class="o">&lt;=</span> <span class="mf">112.5</span> <span class="o">&amp;&amp;</span>
                        <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">)</span> <span class="o">&gt;</span> <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">)</span> <span class="o">&amp;&amp;</span>
                        <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">)</span> <span class="o">&gt;</span> <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">))</span>
                        <span class="p">{</span>
                            <span class="n">returnImg</span><span class="p">.</span><span class="n">ptr</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">)[</span><span class="mi">0</span><span class="p">]</span> <span class="o">=</span> <span class="mi">255</span><span class="p">;</span>
                            <span class="n">imageChanged</span> <span class="o">=</span> <span class="nb">true</span><span class="p">;</span>
                        <span class="p">}</span>
                    <span class="p">}</span>
                <span class="p">}</span>
                <span class="k">else</span> <span class="nf">if</span><span class="p">(</span><span class="n">currentDirection</span> <span class="o">&gt;</span> <span class="mf">22.5</span> <span class="o">&amp;&amp;</span> <span class="n">currentDirection</span> <span class="o">&lt;=</span> <span class="mf">67.5</span><span class="p">)</span>
                <span class="p">{</span>
                    <span class="k">if</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">&gt;</span><span class="mi">0</span> <span class="o">&amp;&amp;</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">&lt;</span><span class="n">workImg</span><span class="p">.</span><span class="n">cols</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span>
                    <span class="p">{</span>
                        <span class="k">if</span><span class="p">(</span><span class="n">lowerThreshold</span><span class="o">&lt;=</span><span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">cv</span><span class="o">::</span><span class="n">Point</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">))</span> <span class="o">&amp;&amp;</span>
                        <span class="n">returnImg</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">)</span><span class="o">!=</span><span class="mi">64</span> <span class="o">&amp;&amp;</span>
                        <span class="n">direction</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">)</span> <span class="o">&gt;</span> <span class="mf">22.5</span> <span class="o">&amp;&amp;</span>
                        <span class="n">direction</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">)</span> <span class="o">&lt;=</span> <span class="mf">67.5</span> <span class="o">&amp;&amp;</span>
                        <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">)</span> <span class="o">&gt;</span> <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">2</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="p">)</span> <span class="o">&amp;&amp;</span>
                        <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">)</span> <span class="o">&gt;</span> <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">2</span><span class="p">))</span>
                        <span class="p">{</span>
                            <span class="n">returnImg</span><span class="p">.</span><span class="n">ptr</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">)[</span><span class="mi">0</span><span class="p">]</span> <span class="o">=</span> <span class="mi">255</span><span class="p">;</span>
                            <span class="n">imageChanged</span> <span class="o">=</span> <span class="nb">true</span><span class="p">;</span>
                        <span class="p">}</span>
                    <span class="p">}</span>
                    <span class="k">if</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">&lt;</span><span class="n">workImg</span><span class="p">.</span><span class="n">rows</span><span class="o">-</span><span class="mi">1</span> <span class="o">&amp;&amp;</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">&gt;</span><span class="mi">0</span><span class="p">)</span>
                    <span class="p">{</span>
                        <span class="k">if</span><span class="p">(</span><span class="n">lowerThreshold</span><span class="o">&lt;=</span><span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">cv</span><span class="o">::</span><span class="n">Point</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">))</span> <span class="o">&amp;&amp;</span>
                        <span class="n">returnImg</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span><span class="o">!=</span><span class="mi">64</span> <span class="o">&amp;&amp;</span>
                        <span class="n">direction</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span> <span class="o">&gt;</span> <span class="mf">22.5</span> <span class="o">&amp;&amp;</span>
                        <span class="n">direction</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span> <span class="o">&lt;=</span> <span class="mf">67.5</span> <span class="o">&amp;&amp;</span>
                        <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span> <span class="o">&gt;</span> <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">2</span><span class="p">)</span> <span class="o">&amp;&amp;</span>
                        <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span> <span class="o">&gt;</span> <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">2</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="p">))</span>
                        <span class="p">{</span>
                            <span class="n">returnImg</span><span class="p">.</span><span class="n">ptr</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)[</span><span class="mi">0</span><span class="p">]</span> <span class="o">=</span> <span class="mi">255</span><span class="p">;</span>
                            <span class="n">imageChanged</span> <span class="o">=</span> <span class="nb">true</span><span class="p">;</span>
                        <span class="p">}</span>
                    <span class="p">}</span>
                <span class="p">}</span>
                <span class="k">else</span>
                <span class="p">{</span>
                    <span class="k">if</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">&gt;</span><span class="mi">0</span><span class="p">)</span>
                    <span class="p">{</span>
                        <span class="k">if</span><span class="p">(</span><span class="n">lowerThreshold</span><span class="o">&lt;=</span><span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">cv</span><span class="o">::</span><span class="n">Point</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">))</span> <span class="o">&amp;&amp;</span>
                        <span class="n">returnImg</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="p">)</span><span class="o">!=</span><span class="mi">64</span> <span class="o">&amp;&amp;</span>
                        <span class="p">(</span><span class="n">direction</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="p">)</span> <span class="o">&lt;</span> <span class="mf">22.5</span> <span class="o">||</span>
                        <span class="n">direction</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="p">)</span> <span class="o">&gt;=</span><span class="mf">157.5</span><span class="p">)</span> <span class="o">&amp;&amp;</span>
                        <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="p">)</span> <span class="o">&gt;</span> <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span> <span class="o">&amp;&amp;</span>
                        <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="p">)</span> <span class="o">&gt;</span> <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">2</span><span class="p">))</span>
                        <span class="p">{</span>
                            <span class="n">returnImg</span><span class="p">.</span><span class="n">ptr</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="p">)[</span><span class="mi">0</span><span class="p">]</span> <span class="o">=</span> <span class="mi">255</span><span class="p">;</span>
                            <span class="n">imageChanged</span> <span class="o">=</span> <span class="nb">true</span><span class="p">;</span>
                        <span class="p">}</span>
                    <span class="p">}</span>
                    <span class="k">if</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">&lt;</span><span class="n">workImg</span><span class="p">.</span><span class="n">rows</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span>
                    <span class="p">{</span>
                        <span class="k">if</span><span class="p">(</span><span class="n">lowerThreshold</span><span class="o">&lt;=</span><span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">cv</span><span class="o">::</span><span class="n">Point</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">))</span> <span class="o">&amp;&amp;</span>
                        <span class="n">returnImg</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="p">)</span><span class="o">!=</span><span class="mi">64</span> <span class="o">&amp;&amp;</span>
                        <span class="p">(</span><span class="n">direction</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="p">)</span> <span class="o">&lt;</span> <span class="mf">22.5</span> <span class="o">||</span>
                        <span class="n">direction</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="p">)</span> <span class="o">&gt;=</span><span class="mf">157.5</span><span class="p">)</span> <span class="o">&amp;&amp;</span>
                        <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="p">)</span> <span class="o">&gt;</span> <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span> <span class="o">&amp;&amp;</span>
                        <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="p">)</span> <span class="o">&gt;</span> <span class="n">sum</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="mi">1</span><span class="p">))</span>
                        <span class="p">{</span>
                            <span class="n">returnImg</span><span class="p">.</span><span class="n">ptr</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="p">(</span><span class="n">pos</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">pos</span><span class="p">.</span><span class="n">x</span><span class="p">)[</span><span class="mi">0</span><span class="p">]</span> <span class="o">=</span> <span class="mi">255</span><span class="p">;</span>
                            <span class="n">imageChanged</span> <span class="o">=</span> <span class="nb">true</span><span class="p">;</span>
                        <span class="p">}</span>
                    <span class="p">}</span>
                <span class="p">}</span>
            <span class="p">}</span>
        <span class="p">}</span>
    <span class="p">}</span>
</pre></div>


<p>And that ends the loop for step 4. After the loop is over, all edge pixels are not ''stale'' - they''re all marked with 64. We need to change that. This is done by a quick little loop: </p>
<div class="codehilite"><pre>    <span class="n">cv</span><span class="o">::</span><span class="n">MatIterator_</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="n">current</span> <span class="o">=</span> <span class="n">returnImg</span><span class="p">.</span><span class="n">begin</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="p">();</span>    <span class="n">cv</span><span class="o">::</span><span class="n">MatIterator_</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="n">final</span> <span class="o">=</span> <span class="n">returnImg</span><span class="p">.</span><span class="n">end</span><span class="o">&lt;</span><span class="kt">unsigned</span> <span class="kt">char</span><span class="o">&gt;</span><span class="p">();</span>
    <span class="k">for</span><span class="p">(;</span><span class="n">current</span><span class="o">!=</span><span class="n">final</span><span class="p">;</span><span class="o">++</span><span class="n">current</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="k">if</span><span class="p">(</span><span class="o">*</span><span class="n">current</span><span class="o">==</span><span class="mi">64</span><span class="p">)</span>
            <span class="o">*</span><span class="n">current</span> <span class="o">=</span> <span class="mi">255</span><span class="p">;</span>
    <span class="p">}</span>
    <span class="k">return</span> <span class="n">returnImg</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>Finally we return the image and we''re done! </p>
<p><span class="tut-alert">The OpenCV Canny algorithm produces slightly different results. I''m not sure why that happens. If you figure out why, do let me know! </span></p>','/static/img/tut/canny-edge-detector.jpg','2011-07-01',1,3,'implementing-canny-edges-from-scratch');
INSERT INTO "aishack_tutorial" VALUES('78xx voltage regulator','',4,'<h2>Without the 78xx ICs</h2>
<p>Different parts of a robot require different voltages. Motors usually run on high voltages, like 12V or 36V. Microcontrollers run on 3.3V or 5V. Electromagnets work on even greater voltages and currents.</p>
<p>If you didn''t have the 78xx ICs, you''d have more batteries on your circuits. One for 5V, another for 36V, another one for 24V, etc. And that would increase weight and space occupied. These ICs save a lot of space and make your robot lighter, and let you conveniently step down to a specific voltage output.</p>
<h2>The 78xx IC</h2>
<p>The 78xx ICs have 3 pins. Two pins with positive polarity and one with negative. The negative polarity pin is common between the input and output voltages. For input, one positive polarity pin is used and for the output, the other one is used.</p>
<figure><img alt="The 7805 voltage regulator" src="/static/img/tut/7805.gif" /><figcaption>
<p>The 7805 voltage regulator</p>
</figcaption>
</figure>
<p>Shown above is a 7805 chip. Here, xx= 05... so the chip maintains a constant 5 volts across the output terminal and the com terminal. Had this been a 7812 chip, it would maintain 12 volts across the two pins. </p>
<h2>Cautions</h2>
<p>When using a voltage regulator, you need to make sure that the current through the IC does not go beyond the limit mentioned in the datasheet. You risk blowing up the regulator.</p>
<p>Also, you need to make sure you plug in the powersupply with the right polarity. Reverse the polarity and the chip heats up really quick. Notice how the IN and OUT pins in the schematic below are connected to positive voltages. </p>
<p>You might also want to include a few capacitors in the circuit, as shown below:</p>
<figure><img alt="The complete 7805 circuit" src="/static/img/tut/7805_circuit.gif" /><figcaption>
<p>The complete 7805 circuit</p>
</figcaption>
</figure>
<p>These capacitors decrease the amount of voltage fluctuations. If there''s an increase... the capacitors store it. If there is a decrease, they release their energy... maintaining a constant voltage across the output and input terminals.</p>
<p>Another point, which is quite obvious, is that the input voltage must be greater than the output  voltage. So you cannot expect a 5V output from a 7805 if you give it 2V. </p>
<h2>Summary</h2>
<p>Well that it! You now know what this chip does! Go on and have fun with it! </p>','/static/img/tut/post-78xx.jpg','2010-07-27',1,4,'78xx-voltage-regulator');
INSERT INTO "aishack_tutorial" VALUES('Why OpenCV?','',5,'<p>Okay. You''ve landed on this page means you''re interested in image processing. You probably have some ideas about image processing and probably even some experience. If you''ve used Matlab, you might hate this sudden change from the relatively easy Matlab to the tough C/C++. There are a couple of why to prefer OpenCV over Matlab. </p>
<figure><img alt="" src="/static/img/tut/matlab_logo.jpg" /><figcaption>
<p>Matlab</p>
</figcaption>
</figure>
<h2>Specific</h2>
<p>OpenCV was made for image processing. Each function and data structure was designed with the Image Processing coder in mind. Matlab, on the other hand, is quite generic. You get almost anything in the world in the form of toolboxes. All the way from financial toolboxes to highly specialized DNA toolboxes.</p>
<h2>Speedy</h2>
<p>Matlab is just way too slow. Matlab itself is built upon Java. And Java is built upon C. So when you run a Matlab program, your computer is busy trying to interpret all that Matlab code. Then it turns it into Java, and then finally executes the code.</p>
<p>If you use C/C++ you don''t waste all that time. You directly provide machine language code to the computer, and it gets executed. So ultimately you get more image processing, and not more interpreting.</p>
<p>I''ve tried doing some real time image processing with both Matlab and OpenCV. I usually got very low speeds, a maximum of about 4-5 frames being processed per second. With OpenCV, I get actual real time processing at around 30 frames being processed per second. </p>
<p>Sure you pay the price for speed - a more cryptic language to deal with, but its definitely worth it... You can do a lot more... you could do some really complex mathematics on images with C and still get away with good enough speeds for your application.</p>
<figure><img alt="" src="/static/img/tut/opencv_logo.gif" /><figcaption>
<p>OpenCV</p>
</figcaption>
</figure>
<h2>Efficient</h2>
<p>Matlab uses just way too much system resources. With OpenCV, you can get away with as little as 10mb RAM for a realtime application. But with today''s computers, the RAM factor isn''t a big thing to be worried about. You do need to take care about memory leaks, but it isn''t that difficult. You can read this article about <a href="/tutorials/opencv-memory-management/">Memory Management in OpenCV</a> if you want.</p>
<p>But if you can get your application to run on a 10 year old computer too, you''re a genius! </p>
<h2>Next Parts</h2>
<p>This post is a part of an article series on OpenCV for Beginners </p>
<ol>
<li><a href="/tutorials/why-opencv/">Why OpenCV?</a></li>
<li><a href="/tutorials/installing-and-getting-opencv-running/">Installing and getting OpenCV running</a></li>
<li><a href="/tutorials/hello-world-with-images/">Hello, World! With Images!</a></li>
<li><a href="/tutorials/filtering-images/">Filtering Images</a></li>
<li><a href="/tutorials/capturing-images/">Capturing Images</a></li>
<li><a href="/tutorials/highgui-creating-interfaces/">HighGUI: Creating Interfaces</a></li>
</ol>','/static/img/tut/post-why-opencv.jpg','2010-02-01',1,3,'why-opencv');
INSERT INTO "aishack_tutorial" VALUES('Installing and Getting OpenCV running','',6,'<h2>Download OpenCV</h2>
<p>The first thing to do is get OpenCV. You can download it from its <a href="http://sourceforge.net/project/showfiles.php?group_id=22870">sourceforge.net page</a>. Make sure you download the latest version and the correct one for your platform.</p>
<p><strong>Update</strong>: OpenCV 2.0 is now available. This post works for OpenCV 1.0. Check <a href="/tutorials/installing-and-configuring-opencv-2-0-on-windows/">how to install OpenCV 2.0</a>. </p>
<h2>Telling your IDE about OpenCV</h2>
<p>Once you''re done installing, you need to change some settings in your IDE so that it knows where to find the header files and the library files for OpenCV.</p>
<p>I''ll demonstrate the process with these IDEs: Microsoft Visual Studio 2008 and Microsoft Visual Studio 6. </p>
<p>Other websites mention how to use OpenCV with other environments:</p>
<p><a href="http://opencv.willowgarage.com/wiki/Eclipse">OpenCV and Eclipse IDE</a> <a href="http://www.softintegration.com/products/thirdparty/opencv/demos/">OpenCV and Ch</a> <a href="http://opencv.willowgarage.com/wiki/C++Builder">OpenCV and C++ Builder</a> <a href="http://opencv.willowgarage.com/wiki/DevCpp">OpenCV and DevCpp</a></p>
<h2>OpenCV and Microsoft Visual Studio 2008</h2>
<p>Start Visual Studio 2008 and goto Tools &gt; Options.</p>
<p><img alt="" src="/static/img/tut/vc2k8_options.jpg" /></p>
<p>In the Options, goto Projects and Solutions &gt; VC++ Directories.</p>
<p><img alt="" src="/static/img/tut/vc2k8_directories.jpg" /></p>
<p>On this page, there is a drop down list called Show directories for. It has six options: Executable files, Include files, Reference files, Library files, Source files and Exclude directories. We''re interested in the Include files and Library files.</p>
<p>Select the Include files option, and setup the options as <strong>shown below</strong>: </p>
<p><img alt="" src="/static/img/tut/vc2k8_include.jpg" /></p>
<p>Note: On my computer, I installed OpenCV in the D:\\Program Files\\OpenCV directory. You might have installed it at some different location, so make sure you change the paths appropriately. </p>
<p>Now change the <em>Show directories _for to _Library files</em>. All the library files of OpenCV are located in just one directory, so simply add that directory:</p>
<p><img alt="" src="/static/img/tut/vc2k8_library.jpg" /></p>
<p>Note: Again, make sure you use the appropriate the directory path.</p>
<p>You''re done! Now your Visual Studio 6 knows where to find OpenCV! </p>
<h2>OpenCV and Microsoft Visual Studio 6</h2>
<p>Start Visual Studio 6.0 and goto Tools &gt; Options.</p>
<p><img alt="" src="/static/img/tut/vc6_options.jpg" /></p>
<p>In the Options dialog box, go to the _Directories _tab.</p>
<p><img alt="" src="/static/img/tut/vc6_directories.jpg" /></p>
<p>On this tab, there is a drop down list called Show directories for. It has four options: Executable files, Include files, Library files and Source files. We''re interested in the Include files and Library files.</p>
<p>Select the Include files option, and setup the options as <strong>shown below</strong>: </p>
<p><img alt="" src="/static/img/tut/vc6_includes.jpg" /></p>
<p>Note: On my computer, I installed OpenCV in the D:\\Program Files\\OpenCV directory. You might have installed it at some different location, so make sure you change the paths appropriately. </p>
<p>Now change the Show directories for to Library files. All the library files of OpenCV are located in just one directory, so simply add that directory:</p>
<p><img alt="" src="/static/img/tut/vc6_library.jpg" /></p>
<p>Note: Again, make sure you use the appropriate the directory path.</p>
<p>You''re done! Now your Visual Studio 6 knows where to find OpenCV! </p>
<h2>What next?</h2>
<p>Now that your IDE knows exactly where OpenCV is, you can make OpenCV applications. To use OpenCV, you need to specify that you want to use OpenCV libraries.</p>
<p>You need to modify your project''s settings in order to do that. I''ll demonstrate how to do that in the next tutorial. </p>
<h2>Next Parts</h2>
<p>This post is a part of an article series on OpenCV for Beginners </p>
<ol>
<li><a href="/tutorials/why-opencv/">Why OpenCV?</a></li>
<li><a href="/tutorials/installing-and-getting-opencv-running/">Installing and getting OpenCV running</a></li>
<li><a href="/tutorials/hello-world-with-images/">Hello, World! With Images!</a></li>
<li><a href="/tutorials/filtering-images/">Filtering Images</a></li>
<li><a href="/tutorials/capturing-images/">Capturing Images</a></li>
<li><a href="/tutorials/highgui-creating-interfaces/">HighGUI: Creating Interfaces</a></li>
</ol>','/static/img/tut/post-installing.jpg','2010-02-04',1,3,'installing-and-getting-opencv-running');
INSERT INTO "aishack_tutorial" VALUES('Hello World! with Images','',7,'<h2>Introduction</h2>
<p>In this tutorial, we''ll go through the essential steps for creating an OpenCV application. You''ll see how to load an image into memory. And how to display it on screen. Along with this you''ll also see some dirty work that needs to be done in order to compile OpenCV programs successfully.</p>
<h2>Step 1: Create a new project</h2>
<p>Create a new Win32 Console Application named Hello.</p>
<p><img alt="" src="/static/img/tut/helloworld_1.jpg" /></p>
<p>Click OK. Accept the defaults. You''ll end up with a bare project with a file named Hello.cpp. Open it, and we''re ready for step 2. </p>
<h2>Step 2: The code</h2>
<p>At the very top of the file Hello.cpp, add the following lines of code: </p>
<div class="codehilite"><pre><span class="cp">#include &lt;cv.h&gt;</span>
<span class="cp">#include &lt;highgui.h&gt;</span>
</pre></div>


<p>This two lines include the main OpenCV headers and HighGUI (a library that lets you display windows).</p>
<p>Then, edit the main function: </p>
<div class="codehilite"><pre><span class="kt">int</span> <span class="nf">main</span><span class="p">()</span>
<span class="p">{</span>
</pre></div>


<p>and add this line to it: </p>
<div class="codehilite"><pre>    <span class="n">IplImage</span><span class="o">*</span> <span class="n">img</span> <span class="o">=</span> <span class="n">cvLoadImage</span><span class="p">(</span><span class="s">&quot;C:</span><span class="se">\\\\</span><span class="s">hello.jpg&quot;</span><span class="p">);</span>
</pre></div>


<p>IplImage is a structure pre-defined in the OpenCV libraries. It used by OpenCV to store an image and contains information about it, like its height, width, etc, and a pointer to the actual image data.</p>
<p>Then add these lines to the main function: </p>
<div class="codehilite"><pre>    <span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;myfirstwindow&quot;</span><span class="p">);</span>

    <span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;myfirstwindow&quot;</span><span class="p">,</span> <span class="n">img</span><span class="p">);</span>
</pre></div>


<p>These two lines use the HighGUI functions cvNamedWindow and cvShowImage. cvNamedWindow creates a new window with the specified title. And you always refer to a window using its title. In this case, its title is myfirstwindow.</p>
<p>cvShowImage does what you think it does... it displays the image passed to it in the given window.</p>
<p>Now, add these lines: </p>
<div class="codehilite"><pre>    <span class="n">cvWaitKey</span><span class="p">(</span><span class="mi">0</span><span class="p">);</span>
    <span class="n">cvReleaseImage</span><span class="p">(</span><span class="o">&amp;</span><span class="n">img</span><span class="p">);</span>
    <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>

<span class="p">}</span>
</pre></div>


<p>cvWaitKey is another HighGUI function. It waits for the given number of miliseconds for a key press, and returns the code of the key pressed. If the given time is 0 miliseconds, or less, it waits till eternity.</p>
<p>cvReleaseImage releases the memory allocated to an image. It is a good practice to always release images. Otherwise, you might end up using HUGE amounts of memory, for no reason. Notice the ampersand before img.</p>
<p>Just as a checkpoint, your code must look like this:</p>
<p><img alt="" src="/static/img/tut/helloworld_2.jpg" /></p>
<p>Everything is case sensitive, so make sure you''ve got it all right. </p>
<p>Also, I''ve placed a file called hello.jpg in the C drive on my computer. You might want to place one too. I used this file, just in case you want:</p>
<p><img alt="" src="/static/img/tut/hello.jpg" /></p>
<h2>Step 3: Telling it to use OpenCV</h2>
<p>Uptill now, we''ve included the OpenCV header files. But these header files just have informations about which function takes which parameters. They don''t have any code which actually manipulates images.</p>
<p>All that code is stored within library files. So we need to include those as well. To do that, go to Project &gt; Hello Properties. </p>
<p><img alt="" src="/static/img/tut/helloworld_3.jpg" /></p>
<p>Then go to Configuration Properties &gt; Linker &gt; Input, and put the following piece of text in the Additional Dependencies: "cv.lib cvaux.lib cxcore.lib highgui.lib", without the quotes of course. </p>
<p><img alt="" src="/static/img/tut/helloworld_4.jpg" /></p>
<p>Note: I''m assuming you added the directories as shown in the previous step, Installing and getting OpenCV running. </p>
<h2>Step 4: Execution and a bit of analysis</h2>
<p>Finally, if everything went right, compile it. You should get no warnings or errors. If you do, make sure your code is exactly the same as in the picture above. Check the case too.</p>
<p>Here''s the output I got:</p>
<p><img alt="" src="/static/img/tut/helloworld_5.jpg" /></p>
<p>If you get an error saying that some DLL was not found, go to the BIN folder in your OpenCV directory and copy all the DLL files there into C:\\Windows\\System32. That should make it work. If not, try copying them into C:\\Windows\\System\\</p>
<p>We created a console application, so we got a console. You can use this console the usual way (like using scanf to input, printf to print out things, etc).</p>
<p>We loaded a JPG file from the disk. cvLoadImage is a really powerful function... reading a JPG file is actually a lot of work, but all of that has been encapsulated into this single function. You can also use other file formats too. Currently supported formats include: </p>
<ul>
<li>Windows bitmaps - BMP, DIB</li>
<li>JPEG files - JPEG, JPG, JPE;</li>
<li>Portable Network Graphics - PNG;</li>
<li>Portable image format - PBM, PGM, PPM;</li>
<li>Sun rasters - SR, RAS;</li>
<li>TIFF files - TIFF, TIF;</li>
<li>OpenEXR HDR images - EXR;</li>
<li>JPEG 2000 images - jp2.</li>
</ul>
<p>And this single function returns a IplImage, irrespective of the type of image loaded.</p>
<p>Next, we created a window with the title "myfirstwindow" and displayed the picture in it. And then we wait till eternity for a key press. If we remove this line, you window will flash, and it will instantly close. Try it out yourself. </p>
<p>And finally, we released the memory allocated for the image.</p>
<h2>Next Parts</h2>
<p>This post is a part of an article series on OpenCV for Beginners </p>
<ol>
<li><a href="/tutorials/why-opencv/">Why OpenCV?</a></li>
<li><a href="/tutorials/installing-and-getting-opencv-running/">Installing and getting OpenCV running</a></li>
<li><a href="/tutorials/hello-world-with-images/">Hello, World! With Images!</a></li>
<li><a href="/tutorials/filtering-images/">Filtering Images</a></li>
<li><a href="/tutorials/capturing-images/">Capturing Images</a></li>
<li><a href="/tutorials/highgui-creating-interfaces/">HighGUI: Creating Interfaces</a></li>
</ol>','/static/img/tut/post-hello-world.jpg','2010-02-07',1,3,'hello-world-with-images');
INSERT INTO "aishack_tutorial" VALUES('Filtering images','',8,'<h2>Introduction</h2>
<p>In the previous tutorial, Hello World with Images, you learned how to load an image. In this tutorial, we''ll take it a step further. You''ll do photoshop style "editing" of the image in real time. Things like increasing the brightness, equalizing the histogram, blurring, removing noise, etc. And doing all of this requires only a few lines of code! </p>
<h2>Step 1: Creating the application</h2>
<p>Create a new Win32 Console Application, and name it "Filters". Save it wherever you like. Accept the defaults and click Finish.</p>
<p><img alt="" src="/static/img/tut/filters_1.jpg" /></p>
<p>This generates a project. Open the file Filters.cpp. We''ll modify its code.</p>
<p>At the top, include the CV headers: </p>
<div class="codehilite"><pre><span class="cp">#include &lt;cv.h&gt;</span>
<span class="cp">#include &lt;highgui.h&gt;</span>
</pre></div>


<p>In the main function, </p>
<div class="codehilite"><pre><span class="kt">int</span> <span class="nf">main</span><span class="p">()</span>
<span class="p">{</span>
</pre></div>


<p>Add these lines to the main function:</p>
<div class="codehilite"><pre>    <span class="n">IplImage</span><span class="o">*</span> <span class="n">img</span> <span class="o">=</span> <span class="n">cvLoadImage</span><span class="p">(</span><span class="s">&quot;C:</span><span class="se">\\\\</span><span class="s">orangeman.jpg&quot;</span><span class="p">);</span>

    <span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;Original&quot;</span><span class="p">);</span>

    <span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;Original&quot;</span><span class="p">,</span> <span class="n">img</span><span class="p">);</span>

    <span class="c1">// We add processing code here</span>

    <span class="n">cvWaitKey</span><span class="p">(</span><span class="mi">0</span><span class="p">);</span>
    <span class="n">cvReleaseImage</span><span class="p">(</span><span class="o">&amp;</span><span class="n">img</span><span class="p">);</span>
    <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>What we''re doing here is, loading the file "C:\\orangeman.jpg" into img. Then we create a window, and display the image in it. This is the original image. And then wait till eternity for a key press. As soon as a key is pressed, the image will be released and the program will terminate.</p>
<p>Now add links to the various OpenCV libraries as shown in Step 3 of the Hello World with OpenCV tutorial. </p>
<h2>Step 2: Trying out things</h2>
<p>We''ll just experiment with the various "tools" available. This will demonstrate the power of OpenCV, and you''ll learn about OpenCV as well. </p>
<h3>Part A: Eroding the image</h3>
<p>Replace the "// We add processing code" herewith the following code:</p>
<div class="codehilite"><pre>    <span class="n">cvErode</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="n">img</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">2</span><span class="p">);</span>

    <span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;Eroded&quot;</span><span class="p">);</span>
    <span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;Eroded&quot;</span><span class="p">,</span> <span class="n">img</span><span class="p">);</span>
</pre></div>


<p>Notice the cvErode? This function takes in image specified in the first parameter, and outputs an eroded image into the second parameter. The third parameter is mostly for advanced uses, so I won''t go into the details about that. The fourth parameter is the number of times you want to erode the image. In my case, I tell it to erode the image twice.</p>
<p>Once we''ve eroded the image, we create a new window titled "Eroded" and display the image in there. Here''s the output I got: </p>
<p><img alt="" src="/static/img/tut/filters_2.jpg" /></p>
<p>Note: cvErode is an in-place function... meaning the input and output images can be same. Not many functions in OpenCV are in-place. Most of them require that the input and output images are different. </p>
<h3>Part B: Dilating the image</h3>
<p>Dilating the image is as simple as eroding it. Just replace "Erode" in the above code with a "Dilate"!! Here''s the complete code: </p>
<div class="codehilite"><pre><span class="kt">int</span> <span class="nf">main</span><span class="p">()</span>
<span class="p">{</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">img</span> <span class="o">=</span> <span class="n">cvLoadImage</span><span class="p">(</span><span class="s">&quot;C:</span><span class="se">\\\\</span><span class="s">orangeman.jpg&quot;</span><span class="p">);</span>
    <span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;Original&quot;</span><span class="p">);</span>

    <span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;Original&quot;</span><span class="p">,</span> <span class="n">img</span><span class="p">);</span>

    <span class="n">cvDilate</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="n">img</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">2</span><span class="p">);</span>
    <span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;Dilated&quot;</span><span class="p">);</span>

    <span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;Dilated&quot;</span><span class="p">,</span> <span class="n">img</span><span class="p">);</span>

    <span class="n">cvWaitKey</span><span class="p">(</span><span class="mi">0</span><span class="p">);</span>
    <span class="n">cvReleaseImage</span><span class="p">(</span><span class="o">&amp;</span><span class="n">img</span><span class="p">);</span>
    <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>Again, cvDilate is an in-place function. Here''s the result I got on my image:</p>
<p><img alt="" src="/static/img/tut/filters_3.jpg" /></p>
<h3>Part C: Brightness</h3>
<p>OpenCV stores images in the form of matrices. Yes, the matrices you studied in high school. If you didn''t, a matrix is a grid of values... something like this:</p>
<p><img alt="" src="/static/img/tut/filters_4.gif" /></p>
<p>In OpenCV''s matrix, each pixel can have a value from 0 to 255. So, each pixel has 8-bits of memory alloted to it. If the image is grayscale, it has just one such matrix. So you often hear of 8-bit grayscale images.</p>
<p>If the image is coloured (say a JPG image), it will have 3 matrices. One matrix for the Red component, one for the Green and one for Blue (or, technically speaking, three 8-bit planes). This means each pixel has 3x8 bits alloted to it (hence, you hear of a 24-bit image).</p>
<p>So to increase the brightness of an image, you just add some value to the entire image. If it is a coloured image, you add that value to each of the components.</p>
<p>To add, we use the cvAddS function. This function adds a scalar to each element of the matrix. There also exists a cvAdd function, but that function adds two matrices (not a matrix and a value).</p>
<p>Replace the // We add processing code herewith the following code: </p>
<div class="codehilite"><pre>    <span class="n">cvAddS</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="n">cvScalar</span><span class="p">(</span><span class="mi">50</span><span class="p">,</span><span class="mi">50</span><span class="p">,</span><span class="mi">50</span><span class="p">),</span> <span class="n">img</span><span class="p">);</span>
    <span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;Bright&quot;</span><span class="p">);</span>
    <span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;Bright&quot;</span><span class="p">,</span> <span class="n">img</span><span class="p">);</span>
</pre></div>


<p>The cvAddS function takes 3 parameters. The first is the source image. The last is the destination image. The second parameter is the value you want to add to each pixel.</p>
<p>Because this is a coloured image, it will have 3 matrices. And we need to add the constant to each of the 3 planes. So we specify the value to be added for each plane using cvScalar(50, 50, 50).</p>
<p><img alt="" src="/static/img/tut/filters_5.jpg" /></p>
<p>Had this been a grayscale image (with only one matrix), we''d do just a cvScalar(50). However, if you did a cvScalar(50) to a coloured image, you''d get wierd results.... something like this:</p>
<p><img alt="" src="/static/img/tut/filters_6.jpg" /></p>
<h3>Part D: Contrast</h3>
<p>For brightness, you added values. For contrast, you multiply.</p>
<p>For adding scalars (values), you use cvAddS. For multiplying, you use cvScale. Here''s the code for it... replace the // We add processing code herewith the following code: </p>
<div class="codehilite"><pre>    <span class="n">cvScale</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="n">img</span><span class="p">,</span> <span class="mi">2</span><span class="p">);</span>
    <span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;Contrast&quot;</span><span class="p">);</span>

    <span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;Contrast&quot;</span><span class="p">,</span> <span class="n">img</span><span class="p">);</span>
</pre></div>


<p>cvScale''s first parameter is the source image, the second is the destination image. And the last parameter is the multiplication value. In this case, each pixel is multiplied by 2. If you multiplied by 1, you won''t see any change.</p>
<p>Here''s the output I got:</p>
<p><img alt="" src="/static/img/tut/filters_7.jpg" /></p>
<h3>Part E: Negative</h3>
<p>Inverting an image is equivalent to doing a logical NOT operation on each element in the matrix. Here''s code for doing it... which I''m sure you can work out on your own now: </p>
<div class="codehilite"><pre>    <span class="n">cvNot</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="n">img</span><span class="p">);</span>
    <span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;Invert&quot;</span><span class="p">);</span>
    <span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;Invert&quot;</span><span class="p">,</span> <span class="n">img</span><span class="p">);</span>
</pre></div>


<p>The cvNot performs a logical NOT on each pixel of the source image (the first parameter) and stores the output in the destination image (the second parameter). Then we create a window, and display the processed image in it:</p>
<p><img alt="" src="/static/img/tut/filters_8.jpg" /></p>
<h2>Why not just use Photoshop?</h2>
<p>This is a question that is often asked... after all, photoshop has a lot more fancy effects... plastic wrap, lens flare and what not.</p>
<p>With Photoshop, you can modify one image and save it. Or at best, modify a batch of images and save them. But thats it.</p>
<p>With OpenCV, you can take the images in realtime (from a camera) and do things with those images in real time. This is something you simply cannot do with Photoshop. </p>
<h2>Conclusion</h2>
<p>I hope you learned quite a bit in this tutorial. In the next tutorial, you''ll see how to take input directly from a webcam! </p>
<h2>Next Parts</h2>
<p>This post is a part of an article series on OpenCV for Beginners </p>
<ol>
<li><a href="/tutorials/why-opencv/">Why OpenCV?</a></li>
<li><a href="/tutorials/installing-and-getting-opencv-running/">Installing and getting OpenCV running</a></li>
<li><a href="/tutorials/hello-world-with-images/">Hello, World! With Images!</a></li>
<li><a href="/tutorials/filtering-images/">Filtering Images</a></li>
<li><a href="/tutorials/capturing-images/">Capturing Images</a></li>
<li><a href="/tutorials/highgui-creating-interfaces/">HighGUI: Creating Interfaces</a></li>
</ol>','/static/img/tut/post-filtering.jpg','2010-02-10',1,3,'filtering-images');
INSERT INTO "aishack_tutorial" VALUES('Capturing images','',9,'<h2>Introduction</h2>
<p>Uptill now, we''ve used static images - images loaded from disk, and we did things with it. Now, you''ll see how to capture images from a camera using the functions within the CV library itself. After we''ve got a working application, we''ll add a filter to modify the image, (you can read up about filters in the Processing and filtering images tutorial).</p>
<h2>Part A: Capturing images</h2>
<p>Create a new Win32 Console Application project... name it whatever you want. I named it Camera.</p>
<p><img alt="" src="/static/img/tut/capture_1.jpg" /></p>
<p>Click OK. As always, accept the defaults and click Finish. Again, this creates a file called Camera.cpp. Open it up. We''ll be modifying it. </p>
<div class="codehilite"><pre><span class="c1">// Camera.cpp : Defines the entry point for the console application.</span>
<span class="c1">//</span>
<span class="cp">#include &quot;stdafx.h&quot;</span>
<span class="kt">int</span> <span class="nf">main</span><span class="p">()</span>
<span class="p">{</span>
    <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>Above is the original Camera.cpp. We''ll start off by including OpenCV headers. Add these lines at the top of Camera.cpp: </p>
<div class="codehilite"><pre><span class="cp">#include &lt;cv.h&gt;</span>
<span class="cp">#include &lt;highgui.h&gt;</span>
</pre></div>


<p>Also, go to Project &gt; Camera Properties &gt; Linker &gt; Input, and put the following piece of text in the Additional Dependencies: "cv.lib cvaux.lib cxcore.lib highgui.lib", without the quotes of course.</p>
<p>With all this done, we''ll start off with the actual capturing part. In OpenCV, you create a CvCapture structure. The structure is defined within the OpenCV headers and it "represents" a camera. If you have more than one camera connected to your computer, you can have this object point to any one camera. </p>
<p>After the structure is created (successfully that is), you can ask it give you the current frame. If you repeatedly ask for the current frame, you can get images in real time. And that is exactly what we''ll be doing: an infinite loop in which you request for the current image.</p>
<p>We''ll start of by creating the capture structure. Add these lines to the main function: </p>
<div class="codehilite"><pre>    <span class="n">CvCapture</span><span class="o">*</span> <span class="n">capture</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span>
    <span class="n">capture</span> <span class="o">=</span> <span class="n">cvCaptureFromCAM</span><span class="p">(</span><span class="mi">0</span><span class="p">);</span>
</pre></div>


<p>capture is the pointer to a CvCapture structure. We initially set it to nothing (the zero). Then you initialize capture to point to the very first camera on your system (camera indices start from 0).</p>
<p>Once we''ve tried initializing capture, we need to make sure that it initialized properly. To do that, just check if capture is non zero. If it is, then it points to a camera properly. Add this code: </p>
<div class="codehilite"><pre>    <span class="k">if</span><span class="p">(</span><span class="o">!</span><span class="n">capture</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="n">printf</span><span class="p">(</span><span class="s">&quot;Could not initialize capturing...\</span>
<span class="s">&quot;</span><span class="p">);</span>
        <span class="k">return</span> <span class="o">-</span><span class="mi">1</span><span class="p">;</span>

    <span class="p">}</span>

    <span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;video&quot;</span><span class="p">);</span>
</pre></div>


<p>If capture is nonzero, it got initialized. If not, we print out a message and exit the program these itself. And we also create a new window, with the title "video".</p>
<p>Now that we have a CvCapture structure, we can request OpenCV to give us frames captured from the camera whenever we want. We''ll start off with an infinite loop. Add this to the main function: </p>
<div class="codehilite"><pre>    <span class="k">while</span><span class="p">(</span><span class="nb">true</span><span class="p">)</span>
    <span class="p">{</span>
</pre></div>


<p>Next, we create an IplImage structure that will store the image captured from the camera: </p>
<div class="codehilite"><pre>        <span class="n">IplImage</span><span class="o">*</span> <span class="n">frame</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span>
</pre></div>


<p>Then we request OpenCV to give us the latest frame using the cvQueryFrame function:</p>
<div class="codehilite"><pre>        <span class="n">frame</span> <span class="o">=</span> <span class="n">cvQueryFrame</span><span class="p">(</span><span class="n">capture</span><span class="p">);</span>

        <span class="k">if</span><span class="p">(</span><span class="o">!</span><span class="n">frame</span><span class="p">)</span>

            <span class="k">break</span><span class="p">;</span>
</pre></div>


<p>The cvQueryFrame function takes capture as a parameter. If you had multiple cameras attached, you could take images from the ones you wanted, and ignore the rest.</p>
<p>Then we check if the image we got is valid or not. If its zero, its an invalid image and we immediately get out of the infinite loop.</p>
<p>Finally, you display the image: </p>
<div class="codehilite"><pre>        <span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;video&quot;</span><span class="p">,</span> <span class="n">frame</span><span class="p">);</span>
</pre></div>


<p>Since this is an infinite loop, you need to have a mechanism to get out of it. We''ll use the cvWaitKey() function I told you about earlier. We''ll use it for two purposes: 1) Create a delay between capturing images (to restrict the number of images taken per second) 2) Check which key was pressed (to be able to decide when to quit).</p>
<p>First, to create a delay: </p>
<div class="codehilite"><pre>        <span class="kt">int</span> <span class="n">c</span> <span class="o">=</span> <span class="n">cvWaitKey</span><span class="p">(</span><span class="mi">20</span><span class="p">);</span>
</pre></div>


<p>This makes sure that the program halts for 20 miliseconds. And in case there is a key press during this period... the ASCII value of the key goes into the variable c.</p>
<p>We can then check the value of c to decide when to get out of the infinite loop. And we do that using the following: </p>
<div class="codehilite"><pre>        <span class="k">if</span><span class="p">((</span><span class="kt">char</span><span class="p">)</span><span class="n">c</span><span class="o">==</span><span class="mi">27</span> <span class="p">)</span>
            <span class="k">break</span><span class="p">;</span>
    <span class="p">}</span>
</pre></div>


<p>27 is the ASCII code for the Escape key. So whenever you press the Escape key, the infinite loop ends.</p>
<p>Once the loop ends, we need to do a bit of cleanup. We need to release the camera so that other applications can use it. And we do that like this: </p>
<div class="codehilite"><pre>    <span class="n">cvReleaseCapture</span><span class="p">(</span><span class="o">&amp;</span><span class="n">capture</span><span class="p">);</span>
    <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>And that finishes up our program! As a checkpoint, here''s the entire program:</p>
<p>Compile your program and execute it. You should see a windows with some video in it.</p>
<h2>Live effects!</h2>
<p>Now that we have a working camera capturing application, you can use OpenCV to process images in real time!</p>
<p>You can really do anything - search for circles, or detect patches of colour, or anything else you can think of. For the sake of explanation, I''ll show how to erode the image.</p>
<p>Just before the line cvShowImage("video", frame); in the code, add this line: </p>
<div class="codehilite"><pre><span class="k">if</span><span class="p">(</span><span class="o">!</span><span class="n">frame</span><span class="p">)</span>

    <span class="k">break</span><span class="p">;</span>

<span class="n">cvErode</span><span class="p">(</span><span class="n">frame</span><span class="p">,</span> <span class="n">frame</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">2</span><span class="p">);</span> <span class="c1">// ADD this line</span>
<span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;video&quot;</span><span class="p">,</span> <span class="n">frame</span><span class="p">);</span>
</pre></div>


<p>Whenever a frame is taken in from the camera, it is eroded and then displayed. So what you ultimately get is an eroded video of yours </p>
<h2>Conclusion</h2>
<p>In this tutorial you learned how to use OpenCV to access all the camera on your computer and also do things with the images you get. Next you''ll learn how to create a bit more advanced user interfaces.</p>
<h2>Next Parts</h2>
<p>This post is a part of an article series on OpenCV for Beginners </p>
<ol>
<li><a href="/tutorials/why-opencv/">Why OpenCV?</a></li>
<li><a href="/tutorials/installing-and-getting-opencv-running/">Installing and getting OpenCV running</a></li>
<li><a href="/tutorials/hello-world-with-images/">Hello, World! With Images!</a></li>
<li><a href="/tutorials/filtering-images/">Filtering Images</a></li>
<li><a href="/tutorials/capturing-images/">Capturing Images</a></li>
<li><a href="/tutorials/highgui-creating-interfaces/">HighGUI: Creating Interfaces</a></li>
</ol>','/static/img/tut/post-capturing-images.jpg','2010-02-13',1,3,'capturing-images');
INSERT INTO "aishack_tutorial" VALUES('HighGUI: Creating Interfaces','',10,'<h2>Introduction</h2>
<p>In this tutorial, you''ll learn how to add trackbars to windows. And also how to detect mouse click events within a window. An application of these flexibilities would be being able to dynamically control things within your program... like changing the amount of erode without recompiling the code.</p>
<p>In this tutorial, we''ll create an application which grabs images from your camera and lets you adjust the brightness and contrast of the image... on the fly. And on clicking, displays the X and Y coordinates of that point. </p>
<h2>On the fly brightness and contrast</h2>
<p>We''ll start off by creating a program that will constantly input images from a camera. If you want, you can read about that in detail in Capturing Images. For now, create a new project of Win32 Console Application. Name it whatever you want. I named it Interface. Click OK and accept the default options by clicking Finish.</p>
<p>We start off by including the OpenCV header files and creating a camera capture object: </p>
<div class="codehilite"><pre><span class="cp">#include &lt;cv.h&gt;</span>
<span class="cp">#include &lt;highgui.h&gt;</span>
<span class="kt">int</span> <span class="nf">main</span><span class="p">()</span>
<span class="p">{</span>
    <span class="n">CvCapture</span><span class="o">*</span> <span class="n">capture</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span>
    <span class="n">capture</span> <span class="o">=</span> <span class="n">cvCaptureFromCAM</span><span class="p">(</span><span class="mi">0</span><span class="p">);</span>
    <span class="k">if</span><span class="p">(</span><span class="o">!</span><span class="n">capture</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="n">printf</span><span class="p">(</span><span class="s">&quot;Could not initialize capturing...\</span>
<span class="s">&quot;</span><span class="p">);</span>
        <span class="k">return</span> <span class="o">-</span><span class="mi">1</span><span class="p">;</span>
    <span class="p">}</span>

    <span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;video&quot;</span><span class="p">);</span>
</pre></div>


<p>The code above creates a capture structure pointing to camera #0 and creates a window named "video".</p>
<p>All this code has been explained in detail in the previous tutorial, Capturing Images. So if you have any doubts, please refer to it.</p>
<p>Now, we create two variables. These variables will hold the value of the trackbars we''ll create in a moment: </p>
<div class="codehilite"><pre>    <span class="kt">int</span> <span class="n">bright</span><span class="o">=</span><span class="mi">128</span><span class="p">,</span> <span class="n">contrast</span><span class="o">=</span><span class="mi">26</span><span class="p">;</span>
</pre></div>


<p>And now we actually create the trackbars: </p>
<div class="codehilite"><pre>    <span class="n">cvCreateTrackbar</span><span class="p">(</span><span class="s">&quot;brightness&quot;</span><span class="p">,</span> <span class="s">&quot;video&quot;</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">bright</span><span class="p">,</span> <span class="mi">255</span><span class="p">,</span> <span class="nb">NULL</span><span class="p">);</span>
    <span class="n">cvCreateTrackbar</span><span class="p">(</span><span class="s">&quot;contrast&quot;</span><span class="p">,</span> <span class="s">&quot;video&quot;</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">contrast</span><span class="p">,</span> <span class="mi">50</span><span class="p">,</span> <span class="nb">NULL</span><span class="p">);</span>
</pre></div>


<p>The cvCreateTrackbar takes in five parameters: </p>
<ol>
<li>The name of the trackbar to be created</li>
<li>The name of the window in which it will be placed</li>
<li>A pointer to a variable (this will hold the value of the trackbar)</li>
<li>The maximum value of the trackbar (the minimum is always 0)</li>
<li>A callback function (which is called whenever the position of the trackbar is changed)</li>
</ol>
<p>We create two trackbars, one named "brightness" and the other named "contrast". Both are placed in the "video" window. We send the addresses of brightness and contrast as pointers too. So, whenever the user moves the trackbar, these variables are updated.</p>
<p>The maximum possible value for brightness is 255 and for contrast is 50. And because we don''t use the callback functions, we send NULL.</p>
<p>Now we get to the infinite loop. Within this infinite loop, we request for frames: </p>
<div class="codehilite"><pre>    <span class="k">while</span><span class="p">(</span><span class="nb">true</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="n">IplImage</span><span class="o">*</span> <span class="n">frame</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span>
        <span class="n">frame</span> <span class="o">=</span> <span class="n">cvQueryFrame</span><span class="p">(</span><span class="n">capture</span><span class="p">);</span>
        <span class="k">if</span><span class="p">(</span><span class="o">!</span><span class="n">frame</span><span class="p">)</span>

            <span class="k">break</span><span class="p">;</span>
</pre></div>


<p>Again, if you have any doubts with whats going on, have a look at Capturing Images.</p>
<p>Now, frame contains the image captured from the camera. We need to modify the image, based on the value stored in brightness and contrast. And we do that using code developed in the Processing and Filtering Images tutorial.</p>
<p>For brightness, we could either reduce or increase brightness. Since the minimum value of a trackbar is always 0, subtracting 128 from brightness would give us values from -128 to 127... which it good enough for our purposes (reduce to increase brightness). Here''s the code: </p>
<div class="codehilite"><pre>        <span class="n">cvAddS</span><span class="p">(</span><span class="n">frame</span><span class="p">,</span> <span class="n">cvScalar</span><span class="p">(</span><span class="n">bright</span><span class="o">-</span><span class="mi">128</span><span class="p">,</span><span class="n">bright</span><span class="o">-</span><span class="mi">128</span><span class="p">,</span><span class="n">bright</span><span class="o">-</span><span class="mi">128</span><span class="p">),</span> <span class="n">frame</span><span class="p">);</span>
</pre></div>


<p>And then, we modify the contrast using the cvScale command. Since this trackbar has a from from 0 to 50... subtracting 25 from contrast will give us a range of -25 to 25. Now, multiplying by a negative number makes no sense (you can''t have negative intensity of pixel... atleast not on a monitor/LCD).</p>
<p>Positive value of the contrast trackbar physically means increasing contrast. For that, we multiply. Ngative physically means is decreasing contrast. And that means dividing by a constant factor. To do this, you use the following code: </p>
<div class="codehilite"><pre>        <span class="k">if</span><span class="p">(</span><span class="n">contrast</span><span class="o">&gt;</span><span class="mi">25</span><span class="p">)</span>
            <span class="n">cvScale</span><span class="p">(</span><span class="n">frame</span><span class="p">,</span> <span class="n">frame</span><span class="p">,</span> <span class="n">contrast</span><span class="o">-</span><span class="mi">25</span><span class="p">);</span>
        <span class="k">else</span> <span class="nf">if</span><span class="p">(</span><span class="n">contrast</span><span class="o">&lt;</span><span class="mi">25</span><span class="p">)</span>
            <span class="n">cvScale</span><span class="p">(</span><span class="n">frame</span><span class="p">,</span> <span class="n">frame</span><span class="p">,</span> <span class="mi">1</span><span class="o">/</span><span class="p">(</span><span class="kt">double</span><span class="p">)(</span><span class="mi">25</span><span class="o">-</span><span class="n">contrast</span><span class="p">));</span>
</pre></div>


<p>If you noticed the code well enough.. you''ll see that nothing happens when contrast = 0 (or, value 25). Thats because, you can''t do either thing... you can''t divide by 0... nor will multiplying by 0 give any meaningful result.</p>
<p>Finally, we display the image in the window "video" and wait for key presses. If the Esc key (ASCII = 27) isn''t pressed you continue with the loop. Else, you exit. </p>
<div class="codehilite"><pre>        <span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;video&quot;</span><span class="p">,</span> <span class="n">frame</span><span class="p">);</span>
        <span class="kt">int</span> <span class="n">c</span> <span class="o">=</span> <span class="n">cvWaitKey</span><span class="p">(</span><span class="mi">20</span><span class="p">);</span>
        <span class="k">if</span><span class="p">((</span><span class="kt">char</span><span class="p">)</span><span class="n">c</span><span class="o">==</span><span class="mi">27</span><span class="p">)</span>
            <span class="k">break</span><span class="p">;</span>

    <span class="p">}</span>

    <span class="n">cvReleaseCapture</span><span class="p">(</span><span class="o">&amp;</span><span class="n">capture</span><span class="p">);</span>
    <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>And this finishes the first part of the tutorial. You can now compile and run the program. You should see the webcam''s video feed on your screen... and two trackbars which you can use to modify the brightness and contrast of the image.</p>
<h2>Detecting mouse clicks</h2>
<p>Now for something different. We''ll print out the coordinates of the point the use clicks. Once you have the coordinates, you can do almost anything... make a sribble type application (with live video going on in the background!!), or something even more wierd.</p>
<p>To accomplish this task, we''ll use a callback function. A callback function is nothing special... its just that another function calls it. In our case, you''ll pass this function (actually, the address of this function) to HighGUI. And HighGUI will call this function whenever any event (like mouse click) occurs.</p>
<p>We''ll first write this function. Add it before the main function: </p>
<div class="codehilite"><pre><span class="kt">void</span> <span class="nf">on_mouse</span><span class="p">(</span><span class="kt">int</span> <span class="n">evt</span><span class="p">,</span> <span class="kt">int</span> <span class="n">x</span><span class="p">,</span> <span class="kt">int</span> <span class="n">y</span><span class="p">,</span> <span class="kt">int</span> <span class="n">flags</span><span class="p">,</span> <span class="kt">void</span><span class="o">*</span> <span class="n">param</span><span class="p">)</span>
<span class="p">{</span>
</pre></div>


<p>The parameters of this functions are provided by the HighGUI library itself. The first parameter is the type of event that occured (left mouse button down/up, etc), followed by the X and Y coordinates. The fourth parameter indicates which buttons were pressed (left/middle/right mouse button, the Ctrl/Alt,Shift button). And finally some user defined parameter.</p>
<p>For now, we''ll just add some printing code: </p>
<div class="codehilite"><pre>    <span class="k">if</span><span class="p">(</span><span class="n">evt</span><span class="o">==</span><span class="n">CV_EVENT_LBUTTONDOWN</span><span class="p">)</span>
        <span class="n">printf</span><span class="p">(</span><span class="s">&quot;Clicked at (%d,%d)\</span>
<span class="s">&quot;</span><span class="p">,</span> <span class="n">x</span><span class="p">,</span> <span class="n">y</span><span class="p">);</span>
<span class="p">}</span>
</pre></div>


<p>So, whenever this function is called, and the event that occured is "left mouse button was pressed), it will print out the coordinates of the point where the mouse was clicked.</p>
<p>Now, we need to tell the HighGUI window to call this function whenever there is any mouse related event. To do that, add this line: </p>
<div class="codehilite"><pre>    <span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;video&quot;</span><span class="p">);</span>
    <span class="n">cvSetMouseCallback</span><span class="p">(</span><span class="s">&quot;video&quot;</span><span class="p">,</span> <span class="n">on_mouse</span><span class="p">,</span> <span class="mi">0</span><span class="p">);</span> <span class="c1">// ADD this line</span>
    <span class="kt">int</span> <span class="n">bright</span><span class="o">=</span><span class="mi">128</span><span class="p">,</span> <span class="n">contrast</span><span class="o">=</span><span class="mi">26</span><span class="p">;</span>
</pre></div>


<p>We''re setting the mouse callback, for the window "video". The callback function is on_mouse (note that there are no parantheses after on_mouse). And finally, because we''re not using and user defined parameter, we send a 0.</p>
<p>And we''re done! Compile and execute this program and try clicking on the webcam image you see!! </p>
<h2>Wrap up</h2>
<p>In this tutorial, you learned a bit more about HighGUI and how you can make use of it. You learned about trackbars and using them to affect calculations in your program. You also learned how you can use your mouse.</p>
<h2>Other parts</h2>
<p>This post is a part of an article series on OpenCV for Beginners </p>
<ol>
<li><a href="/tutorials/why-opencv/">Why OpenCV?</a></li>
<li><a href="/tutorials/installing-and-getting-opencv-running/">Installing and getting OpenCV running</a></li>
<li><a href="/tutorials/hello-world-with-images/">Hello, World! With Images!</a></li>
<li><a href="/tutorials/filtering-images/">Filtering Images</a></li>
<li><a href="/tutorials/capturing-images/">Capturing Images</a></li>
<li><a href="/tutorials/highgui-creating-interfaces/">HighGUI: Creating Interfaces</a></li>
</ol>','/static/img/tut/post-highgui-creating-interfaces.jpg','2010-02-16',1,3,'highgui-creating-interfaces');
INSERT INTO "aishack_tutorial" VALUES('A super fast thresholding technique','',11,'<p>In computer vision, <a href="/tutorials/thresholding/">thresholding</a> is probably the most basic operation. It needs to go through every single pixel of every single frame to detect objects. If you can make it efficient, you''ll have CPU time to do other stuff. Today (after a long time, I might add) I''ll introduce you to an interesting technique that can reduce the number of operations per pixel. </p>
<h2>The standard way</h2>
<p>The usual way to go about thresholding would be to check if the values in each channel are within a certain range or not. Psuedo code for this would look like: </p>
<div class="codehilite"><pre><span class="k">if</span> <span class="p">(</span><span class="n">redcomponent</span> <span class="o">&gt;</span> <span class="n">somevalue1</span> <span class="o">&amp;&amp;</span>
    <span class="n">redcomponent</span> <span class="o">&lt;</span> <span class="n">somevalue2</span> <span class="o">&amp;&amp;</span>
    <span class="n">greencomponent</span> <span class="o">&gt;</span> <span class="n">somevalue3</span> <span class="o">&amp;&amp;</span>
    <span class="n">greencomponent</span> <span class="o">&lt;</span><span class="err"> </span><span class="n">somevalue4</span> <span class="o">&amp;&amp;</span>
    <span class="n">bluecomponent</span> <span class="o">&gt;</span> <span class="n">somevalue5</span> <span class="o">&amp;&amp;</span>
    <span class="n">bluecomponent</span> <span class="o">&lt;</span> <span class="n">somevalue6</span><span class="p">)</span>
<span class="p">{</span>
    <span class="c1">// Do something (like mark it as white)</span>
<span class="p">}</span>
</pre></div>


<p>The problem with this is, it takes six comparisons - too much. Another problem is the extensive branching it does. The branching messes up pipelined processors. Not good.</p>
<figure><img alt="Thresholding with the RGB space" src="/static/img/tut/3d-space-in-thresholding1.jpg" /><figcaption>
<p>Thresholding with the RGB space</p>
</figcaption>
</figure>
<h2>The new technique</h2>
<p>The problem with the previous approach is that it uses two comparison for every channel. But these comparisons are always constant - for red, it''s always from somevalue1 to somevalue2. So here''s the key idea:</p>
<p>We can create an array or table of 256 elements. Set values in the range somevalue1 to somevalue2 to 1 and everything else to zero. Similarly, create two more arrays for green and blue. </p>
<figure><img alt="The tables created for red, green and blue" src="/static/img/tut/tables.gif" /><figcaption>
<p>The tables created for red, green and blue</p>
</figcaption>
</figure>
<p>Now, to check if a certain pixel should be marked white or not, we could use the following pseudocode: </p>
<div class="codehilite"><pre><span class="k">if</span><span class="p">(</span><span class="n">table_red</span><span class="p">[</span><span class="n">redcomponent</span><span class="p">]</span> <span class="o">&amp;&amp;</span>
    <span class="n">table_green</span><span class="p">[</span><span class="n">greencomponent</span><span class="p">]</span> <span class="o">&amp;&amp;</span>
    <span class="n">table_blue</span><span class="p">[</span><span class="n">bluecomonent</span><span class="p">])</span>
<span class="p">{</span>
    <span class="c1">// do something</span>
<span class="p">}</span>
</pre></div>


<p>If redcomponent is a value between somevalue1 and somevalue2, the table will contain a 1. Otherwise a zero. Similarly for other channels. If the color lies in the correct range, the condition evaluates to true. And you know you need to mark this pixel as white (or whatever you want to do)!</p>
<p>Simple, isn''t it? You''re trading a bit of memory for an increase in speed.</p>
<p><span class="tut-success">You don''t need to write code for this little technique. OpenCV (and most other vision packages) use exactly this for thresholding. They even use specialized processor instructions to make it go faster.</span></p>
<h2>Parallel thresholding</h2>
<p>Here''s an interesting idea presented in the paper (find it below). Let''s say the tables you make are arrays integer type. You''re only storing a ''1'' to mark if a certain value can be accepted.</p>
<p>The ''1'' is just a single bit. You have 31 extra bits (on 32 bit machines). You could use those bits to store a ''1'' for other colors. So the first bit could correspond to a yellowish shade, the second to a bluish shade, the third to an orangish shade, etc. Then, the result of the and''ing would be a 32 bit integer. Its first bit is ''1'' if the color is yellowish. The second bit is ''1'' if the color is bluish. The third bit  would be ''1'' if the color is orangish.</p>
<p>In this example, both the first and third bits can be ''1'' simultaneously. This indicates that the color belongs to two classes - orange and yellow! Based on this, you could set the pixel to white in two different images (one for yellow and one for orange).</p>
<p>This way, you can do up to 32 colors simultaneously. That''s a LOT of colors!</p>
<p><span class="tut-warn">You''ll probably need to write code for this - you''ll have to decide which bit corresponds to which color.</span></p>
<h2>Experimental results</h2>
<p>I did a quick test to verify the paper - I used a custom function that takes an image, goes through each pixel, does the 6 comparisons and marks the pixels as foreground if necessary. Competing against this function was <a href="/tutorials/thresholding/">the standard threshold function of OpenCV</a>.</p>
<p>Thanks for Shervin Emami for <a href="/tutorials/timing-macros-in-c/">the timing macros</a>! You might find them useful as well.</p>
<p>The results were obvious: </p>
<table>
<thead>
<tr>
<th>Image size (pixels)</th>
<th>Standard (ms)</th>
<th>Super fast method (ms)</th>
</tr>
</thead>
<tbody>
<tr>
<td>73902</td>
<td>1.278624</td>
<td>0.394651</td>
</tr>
<tr>
<td>636000</td>
<td>5.791450</td>
<td>2.213925</td>
</tr>
<tr>
<td>1555200</td>
<td>13.664513</td>
<td>5.687084</td>
</tr>
</tbody>
</table>
<p>That is an almost 300% increase in speed. I did ignore the fact that you can use SIMD instructions to speed it up further. But a 3x increase in speed has way more weightage!</p>','/static/img/tut/post-superfast-thresholding.jpg','2011-05-31',1,2,'a-super-fast-thresholding-technique');
INSERT INTO "aishack_tutorial" VALUES('Thresholding','',12,'<h2>Introduction</h2>
<p>Thresholding is one of the most basic techniques for what is called Image Segmentation. When you threshold an image, you get segments inside the image... each representing something. For example... complex segmentation algorithms might be able to segment out "house-like" structures in an image.</p>
<p>With thresholding, you can segment the image based on colour. For example, you can segment all red colour in an image. </p>
<h2>Our Goal</h2>
<p>Here''s what we''ll be making in this tutorial: an application that will threshold out the red regions in an image... something like this:</p>
<figure><img alt="An example of how thresholding works" src="/static/img/tut/thresholding_example.jpg" /><figcaption>
<p>An example of how thresholding works</p>
</figcaption>
</figure>
<p>You might ask, exactly why go through all the trouble of thresholding an image? The reason for this is: The thresholded image is easier for the computer to analyse. It has got clear, stark boundaries, so the computer can easily find the boundary of each region (each of which represents a red patch).</p>
<p>Remember, thresholding isn''t the best algorithm (as you''ll see later)... but it gives reasonably good results for many images (as you can see in the image above). </p>
<h2>The project</h2>
<p>Start off by creating a C++ Win32 console application. Choose any name you want and click OK. Then, accept the default options and click Finish.</p>
<p>As always, we''ll start off by adding OpenCV''s headers: </p>
<div class="codehilite"><pre><span class="cp">#include &lt;cv.h&gt;</span>
<span class="cp">#include &lt;highgui.h&gt;</span>
</pre></div>


<p>Then, goto the Project &gt; Properties &gt; Configuration Properties &gt; Linker &gt; Input, and put the following piece of text in the Additional Dependencies: "cv.lib cvaux.lib cxcore.lib highgui.lib", without the quotes of course. Now we''re ready to use OpenCV.</p>
<p>We''ll start off by loading an image. Write this in the main function: </p>
<div class="codehilite"><pre><span class="kt">int</span> <span class="nf">main</span><span class="p">()</span>
<span class="p">{</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">img</span> <span class="o">=</span> <span class="n">cvLoadImage</span><span class="p">(</span><span class="s">&quot;C:</span><span class="se">\\\\</span><span class="s">shaastra.jpg&quot;</span><span class="p">);</span>
</pre></div>


<p>NOTE: Make sure you change the image''s path to something that actually exists.</p>
<p>Now, we''ll create 3 grayscale images. These 3 images will hold the red, green and blue channels of the image img. Add these lines to the main function: </p>
<div class="codehilite"><pre>    <span class="n">IplImage</span><span class="o">*</span> <span class="n">channelRed</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvGetSize</span><span class="p">(</span><span class="n">img</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">channelGreen</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvGetSize</span><span class="p">(</span><span class="n">img</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">channelBlue</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvGetSize</span><span class="p">(</span><span class="n">img</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>
</pre></div>


<p>The cvCreateImage function allocates memory for an image. Currently, all these images are the same blank... each pixel is black.</p>
<p>Now, we''ll copy each channel into these images... one at a time: </p>
<div class="codehilite"><pre>    <span class="n">cvSplit</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="n">channelBlue</span><span class="p">,</span> <span class="n">channelGreen</span><span class="p">,</span> <span class="n">channelRed</span><span class="p">,</span> <span class="nb">NULL</span><span class="p">);</span>
</pre></div>


<p>The cvSplit command split the 3 channel image img into three different channels. The order is Blue, Green and Red because thats how its stored in memory.</p>
<p>Up till now, we have the three channels with us:</p>
<figure><img alt="The three channels comprising the image" src="/static/img/tut/thresholding_channels.jpg" /><figcaption>
<p>Red, green and blue channels of the image</p>
</figcaption>
</figure>
<p>We''re interested in finding out the red regions... so we''ll focus on the red channel (the top most in the above image).</p>
<p>You''ll notice that not just the red regions are bright in the red channel... even the white regions are bright (because white=red+green+blue... so white is seen in all three channels).</p>
<p>To extract actual red areas, we remove areas common with the green and blue channels... something like this: Just red = red channel - (green channel + blue channel). And we implement this in code using the following commands (add these to the main function): </p>
<div class="codehilite"><pre>    <span class="n">cvAdd</span><span class="p">(</span><span class="n">channelBlue</span><span class="p">,</span> <span class="n">channelGreen</span><span class="p">,</span> <span class="n">channelGreen</span><span class="p">);</span>

    <span class="n">cvSub</span><span class="p">(</span><span class="n">channelRed</span><span class="p">,</span> <span class="n">channelGreen</span><span class="p">,</span> <span class="n">channelRed</span><span class="p">);</span>
</pre></div>


<p>Basically, what we''ve done is add the blue and green channels, and store the result in the green channel. Then, subtract this green channel from the red channel. And store the result in red channel.</p>
<p>Here is what channelRed has after these operations have been performed:</p>
<figure><img alt="Only the red part remains" src="/static/img/tut/thresholding_onlyred.jpg" /><figcaption>
<p>Only the red part remains</p>
</figcaption>
</figure>
<p>Notice that this in this image, only the actual red regions are bright... the rest of the image is dark. So uptill now we''ve been successful in isolating the red regions in the image.</p>
<p>Now, we do the thresholding. Add these lines to the main function: </p>
<div class="codehilite"><pre>    <span class="n">cvThreshold</span><span class="p">(</span><span class="n">channelRed</span><span class="p">,</span> <span class="n">channelRed</span><span class="p">,</span> <span class="mi">20</span><span class="p">,</span> <span class="mi">255</span><span class="p">,</span> <span class="n">CV_THRESH_BINARY</span><span class="p">);</span>
</pre></div>


<p>After this line, channelRed stores this:</p>
<figure><img alt="The thresholded image" src="/static/img/tut/thresholding_thresholded1.jpg" /><figcaption>
<p>The thresholded image</p>
</figcaption>
</figure>
<p>See how the red region turn bright? This is segmentation. You create segments... White=red in the original image... black=non red.</p>
<p>Now, an analysis of what actually happens in the cvThreshold function. The function goes through each pixel of the image. If the value of the pixel is greater than 20 (the third parameter)... it changes it to a 255 (the fourth parameter). Thats the reason all the reds turn bright.</p>
<p>The first parameter is the source image. The second is the destination image.</p>
<p>And see the last parameter? (CV_THRESH_BINARY) This parameter decides the behaviour of this function. CV_THRESH_BINARY change the value to 255 when the value is greater than 20. An other possible value is: CV_THRESH_BINARY_INV... which is the reverse: if the value is greater than 20, it is set it 0... else it is set to 255.</p>
<p>Now that we''ve thresholded the image, all we need to do is display it. Add these lines: </p>
<div class="codehilite"><pre>    <span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;original&quot;</span><span class="p">);</span>
    <span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;red&quot;</span><span class="p">);</span>
    <span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;original&quot;</span><span class="p">,</span> <span class="n">img</span><span class="p">);</span>
    <span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;red&quot;</span><span class="p">,</span> <span class="n">channelRed</span><span class="p">);</span>
    <span class="n">cvWaitKey</span><span class="p">(</span><span class="mi">0</span><span class="p">);</span>
    <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>Execute the program, and you should see the thresholded image. </p>
<h2>Thresholding isn''t that great</h2>
<p>But it lets you get through a lot of situations quite easily (and efficiently). If you tried thresholding the same image to get the green patches, you''d get something like this:</p>
<figure><img alt="Bad thresholding" src="/static/img/tut/thresholding_bad.jpg" /><figcaption>
<p>Bad thresholding</p>
</figcaption>
</figure>
<p>You do get some greenish areas, but none of them isn''t prominent enough.. and would probably be discarded as noise.</p>
<p>In such situations, you could try converting the image into HSV colour space. And then, segmenting the H channel. You''d have a narrow range of hues for green... to do that, you''d have to use the cvInRangeS function... which is described below.</p>
<h2>Advanced Thresholding</h2>
<p>The cvThreshold function is good for simple purposes... places where you just need to check if a pixel''s value is greater or less than a particular value.</p>
<p>More powerful functions are the cvCmp, cvCmpS, inRange and inRangeS function. The functions ending in an S let you compare the image against a particular value (like 20). The others let you compare the image against another image (so you could have different comparison values for different pixels).</p>
<p>The cvCmp function lets you specify the type of comparison (greater than, greater or equal, etc). Its syntaxes are: </p>
<div class="codehilite"><pre><span class="n">cvCmp</span><span class="p">(</span><span class="n">src1</span><span class="p">,</span> <span class="n">src2</span><span class="p">,</span> <span class="n">dst</span><span class="p">,</span> <span class="n">cmp_op</span><span class="p">);</span>
<span class="n">cvCmpS</span><span class="p">(</span><span class="n">src</span><span class="p">,</span> <span class="n">value</span><span class="p">,</span> <span class="n">dst</span><span class="p">,</span> <span class="n">cmp_op</span><span class="p">);</span>
</pre></div>


<p><code>cmp_op</code> can take these values: </p>
<ul>
<li>CV_CMP_EQ - equal to</li>
<li>CV_CMP_GT - greater than</li>
<li>CV_CMP_GE - greater or equal</li>
<li>CV_CMP_LT - less than</li>
<li>CV_CMP_LE - less or equal</li>
<li>CV_CMP_NE - not equal to</li>
</ul>
<p>The inRange function lets you specify a range of values (a minimum and a maximum) which is converted to a 255. Any value outside the range is set to 0. Its syntaxes are: </p>
<div class="codehilite"><pre><span class="n">cvInRange</span><span class="p">(</span><span class="n">src1</span><span class="p">,</span> <span class="n">lowersrc</span><span class="p">,</span> <span class="n">uppersrc</span><span class="p">,</span> <span class="n">dst</span><span class="p">);</span>
<span class="n">cvInRangeS</span><span class="p">(</span><span class="n">src</span><span class="p">,</span> <span class="n">scalarLower</span><span class="p">,</span> <span class="n">scalarHigher</span><span class="p">,</span> <span class="n">dst</span><span class="p">);</span>
</pre></div>


<p>Pretty much self explanatory. This function can be used to threshold out an HSV image... where the H channel holds the colour image. I''ve written a tutorial that uses these function, you might be interested in reading it: Tracking coloured objects. </p>
<h2>Wrap up</h2>
<p>Thats it for now. I hope you learned something from this.</p>','/static/img/tut/post-thresholding.jpg','2010-01-03',1,3,'thresholding');
INSERT INTO "aishack_tutorial" VALUES('Timing macros in C/C++','',13,'<p>Often you need to calculate the time it takes to execute a certain set of operations. And if you''re trying to optimize your code, you''ll need this even more. So here''s a set of useful  macros that can help you do that (without any plumbing). </p>
<h2>The Timing Macros</h2>
<p>These macros use the OpenCV functions cvGetTickCount() and cvGetTickFrequency(). So they''ll work only for your computer vision projects. These macros should work on all platforms. </p>
<div class="codehilite"><pre><span class="c1">// Record the execution time of some code, in milliseconds.</span>
<span class="cp">#define DECLARE_TIMING(s)  int64 timeStart_##s; double timeDiff_##s; double timeTally_##s = 0; int countTally_##s = 0</span>
<span class="cp">#define START_TIMING(s)    timeStart_##s = cvGetTickCount()</span>
<span class="cp">#define STOP_TIMING(s)     timeDiff_##s = (double)(cvGetTickCount() - timeStart_##s); timeTally_##s += timeDiff_##s; countTally_##s++</span>
<span class="cp">#define GET_TIMING(s)      (double)(timeDiff_##s / (cvGetTickFrequency()*1000.0))</span>
<span class="cp">#define GET_AVERAGE_TIMING(s)   (double)(countTally_##s ? timeTally_##s/ ((double)countTally_##s * cvGetTickFrequency()*1000.0) : 0)</span>
<span class="cp">#define CLEAR_AVERAGE_TIMING(s) timeTally_##s = 0; countTally_##s = 0</span>
</pre></div>


<h2>Using the macros</h2>
<p>Using these timing macros is really easy! Before doing anything, you must declare a timer. You must supply a name for the timer. Based on the name, new variables are created (that hold timing information). Then you can start and stop the timer. If you''re using the timer for multiple operations done in an iteration, you can check the average time.</p>
<p>Here''s some code to get your started: </p>
<div class="codehilite"><pre><span class="c1">// Example:</span>
<span class="n">DECLARE_TIMING</span><span class="p">(</span><span class="n">myTimer</span><span class="p">);</span>
<span class="k">while</span> <span class="p">(</span><span class="n">something</span><span class="p">)</span>
<span class="p">{</span>
    <span class="n">START_TIMING</span><span class="p">(</span><span class="n">myTimer</span><span class="p">);</span>
    <span class="n">printf</span><span class="p">(</span><span class="s">&quot;Hello!\</span>
<span class="s">&quot;</span><span class="p">);</span>
    <span class="n">STOP_TIMING</span><span class="p">(</span><span class="n">myTimer</span><span class="p">);</span>
<span class="p">}</span>
<span class="n">printf</span><span class="p">(</span><span class="s">&quot;Execution time: %f ms.\</span>
<span class="s">&quot;</span><span class="p">,</span> <span class="n">GET_TIMING</span><span class="p">(</span><span class="n">myTimer</span><span class="p">)</span> <span class="p">);</span>
<span class="n">printf</span><span class="p">(</span><span class="s">&quot;Average time: %f ms per iteration.\</span>
<span class="s">&quot;</span><span class="p">,</span> <span class="n">GET_AVERAGE_TIMING</span><span class="p">(</span><span class="n">myTimer</span><span class="p">)</span> <span class="p">);</span>
</pre></div>


<p>Pretty simple. </p>
<h2>Summary</h2>
<p>You now have some really great macros for timing your programs.</p>','/static/img/tut/post-timing-macros.jpg','2010-08-19',2,5,'timing-macros');
INSERT INTO "aishack_tutorial" VALUES('The Sobel and Laplacian Edge Detectors','',14,'<p>Detecting edges is one of the fundamental operations you can do in image processing. It helps you reduce the amount of data (pixels) to process and maintains the "structural" aspect of the image. We''ll look at two  commonly used edge detection schemes - the gradient based edge detector and the laplacian based edge detector. Both of them work with <a href="/tutorials/convolutions">convolutions</a> and achieve the same end goal - finding edges. </p>
<h2>Relating edges and derivatives</h2>
<p>Just for this section, I''ll limit the discussion to one dimensional images. It''s difficult to "show" it if the things are in two dimensions. Have a look at this:</p>
<figure><img alt="Detecting an edge in an image" src="/static/img/tut/sample-edge.jpg" />  <figcaption>
<p>The curve representing intensity  </p>
</figcaption>
</figure>
<p>The lower part is the 1-D image. The upper part is the intensity of each pixel of the 1-D image plotted as a graph. Blacks have a low intensity, so the graph curve is low. It reaches full height at the white end of the image. Note that the center of the curve has a steep slope - meaning you''ve got an edge!</p>
<figure><img alt="Detecting edges with gradient method" src="/static/img/tut/sample-edge-first-derivative.jpg" />  <figcaption>
<p>The first derivative of the curve above  </p>
</figcaption>
</figure>
<p>Looking for these peaks is exactly what <strong>gradient based edge detection</strong> methods do. You''re not interested in what the actual colors are. If the change is steep enough, you mark it as an edge pixel. Though these methods work well, there''s one drawback - how do you decide what is a peak and what isn''t? There has to be a certain threshold above which an edge is classified as a peak else it must be considered part of noise. Here''s the next key idea: On the left (where the curve is rising), the slope is positive. On the right, the slope is negative. So there must exist a point where there is a zero crossing. That point is the edge''s location. Edge detectors that are based on this idea are called <strong>Laplacian edge detectors</strong>.</p>
<figure><img alt="Edge detection with the Laplacian operator" src="/static/img/tut/sample-edge-second-derivative.jpg" />  <figcaption>
<p>The second order derivative  </p>
</figcaption>
</figure>
<p>Now, all of this is for 1-D images. It turns out that all of this holds for 2-D images as well. So we can simply use these results and try them on actual images. Another thing is - these are based on continuous images. For us, that is never the case. So we''ll have to approximate these derivatives based on the pixelated data that we do have. This is done with the help of <a href="/tutorials/convolutions/">convolutions</a>. </p>
<h2>The Sobel Edge Detector</h2>
<p>The Sobel edge detector is a gradient based method. It works with first order derivatives. It calculates the first derivatives of the image separately for the X and Y axes. The derivatives are only approximations (because the images are not continuous). To approximate them, the following kernels are used for convolution: </p>
<figure><img alt="Kernels used in the Sobel edge detection" src="/static/img/tut/sobel-kernels1.jpg" /><figcaption>
<p>Kernels used in the Sobel edge detection</p>
</figcaption>
</figure>
<p>The kernel on the left approximates the derivative along the X axis. The one on the right is for the Y axis. Using this information, you can calculate the following: </p>
<ul>
<li>Magnitude or "strength" of the edge: <img alt="" src="http://s0.wp.com/latex.php?latex=%5Csqrt%7BG_x%5E2%20%2B%20G_y%5E2%7D&amp;bg=ffffff&amp;fg=000&amp;s=0" /></li>
<li>Approximate strength: <img alt="" src="http://s0.wp.com/latex.php?latex=%7CG_x%7C%2B%20%7CG_y%7C&amp;bg=ffffff&amp;fg=000&amp;s=0" /></li>
<li>The orientation of the edge: <img alt="" src="http://s0.wp.com/latex.php?latex=%5Carctan%28%5Cfrac%7BG_y%7D%7BG_x%7D%29&amp;bg=ffffff&amp;fg=000&amp;s=0" /></li>
</ul>
<figure><img alt="Result of the horizontal sobel operator" src="/static/img/tut/conv-sobel-result.png" /> <figcaption>
<p>Result of the horizontal sobel operator</p>
</figcaption>
</figure>
<p>Above, I''ve detected horizontal peaks. You can clearly see the horizontal edges highlighted. You can then <a href="/tutorials/thresholding/">threshold</a> this result to get rid of the grey areas and get solid edges. </p>
<h2>The Laplacian Edge Detector</h2>
<p>Unlike the Sobel edge detector, the Laplacian edge detector uses only one kernel. It calculates second order derivatives in a single pass. Here''s the kernel used for it:</p>
<figure><img alt="The kernel for the laplacian operator" src="/static/img/tut/conv-laplacian.jpg" /><figcaption>
<p>The kernel for the laplacian operator</p>
</figcaption>
</figure>
<p>You can use either one of these. Or if you want a better approximation, you can create a 5x5 kernel (it has a 24 at the center and everything else is -1). Simple stuff. One serious drawback though - because we''re working with second order derivatives, the laplacian edge detector is extremely sensitive to noise. Usually, you''ll want to reduce noise - maybe using the Gaussian blur. Here''s a result I got:</p>
<figure><img alt="The result of convolution with the laplacian operator" src="/static/img/tut/conv-laplacian-result.png" /><figcaption>
<p>The result of convolution with the laplacian operator</p>
</figcaption>
</figure>
<p>Laplacians are computationally faster to calculate (only one kernel vs two kernels) and sometimes produce exceptional results!</p>','/static/img/tut/post-sobel-laplacian.jpg','2011-04-24',1,2,'the-sobel-and-laplacian-edge-detectors');
INSERT INTO "aishack_tutorial" VALUES('K-Nearest Neighbors in OpenCV','',15,'<p>K-Nearest Neighbors is a very simple machine learning algorithm. And OpenCV comes with it built in! In this post, we''ll use a freely available dataset (of handwritten digits), train a K-Nearest algorithm, and then use it to recognize digits. We will be using a few file operations (fopen, fread, etc). If you''re not familiar with those, just review them once.﻿ </p>
<h2>Handwritten digits dataset</h2>
<p>A massive dataset of handwritten digits is available on <a href="http://yann.lecun.com/exdb/mnist/">Yann LeCun''s website</a>. Get all four files. The files contain the training images, training labels, testing images and actual labels for test images.</p>
<p>The files won''t open with a standard image viewer (Picasa, etc). We''ll have to write our own code to read images and labels from these files. </p>
<h2>Training: Loading the dataset</h2>
<p>We''ll use standard file operations in C/C++ to load the dataset. Yann''s website describes how data is stored in each file.</p>
<p>For files containing images, the first sixteen bytes contain information about the file. The first four bytes form a magic number (to ensure you''re reading a correct file). The next four bytes contain the number of images (an integer has 4 bytes). The next four bytes have the number of rows. The next four have the number of columns. After this, individual pixels of each image are listed (row-wise). </p>
<p>And for files containing labels, the first four bytes form the magic number. The next four bytes is the number of labels. And after that, each byte corresponds to one label. Each label is between 0 and 9.</p>
<p>With that in mind, <strong>create a new project</strong>. Include the OpenCV headers + standard header and link to syour OpenCV libraries. </p>
<div class="codehilite"><pre><span class="cp">#include &lt;cv.h&gt;</span>
<span class="cp">#include &lt;highgui.h&gt;</span>
<span class="cp">#include &lt;ml.h&gt;</span>
<span class="cp">#include &lt;time.h&gt;</span>

<span class="cp">#include &lt;stdio.h&gt;</span>

<span class="cp">#include &lt;stdlib.h&gt;</span>

<span class="k">using</span> <span class="k">namespace</span> <span class="n">cv</span><span class="p">;</span>

<span class="kt">int</span> <span class="nf">main</span><span class="p">()</span>
<span class="p">{</span>
<span class="err">   </span> <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>I''ll be using the C++ interface of OpenCV, so I''ve included the cv namespace too. Start off by creating two new file pointers: </p>
<div class="codehilite"><pre><span class="kt">int</span> <span class="nf">main</span><span class="p">()</span>
<span class="p">{</span>
<span class="err">   </span> <span class="kt">FILE</span> <span class="o">*</span><span class="n">fp</span> <span class="o">=</span> <span class="n">fopen</span><span class="p">(</span><span class="s">&quot;C:</span><span class="se">\\</span><span class="s">train-images.idx3-ubyte&quot;</span><span class="p">,</span> <span class="s">&quot;rb&quot;</span><span class="p">);</span>

<span class="err">   </span> <span class="kt">FILE</span> <span class="o">*</span><span class="n">fp2</span> <span class="o">=</span> <span class="n">fopen</span><span class="p">(</span><span class="s">&quot;C:</span><span class="se">\\</span><span class="s">train-labels.idx1-ubyte&quot;</span><span class="p">,</span> <span class="s">&quot;rb&quot;</span><span class="p">);</span>

<span class="err">   </span> <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>This opens both files in binary, read only mode. Then a little exception handling. It one of the files didn''t open, we can''t proceed. </p>
<div class="codehilite"><pre><span class="err">   </span> <span class="k">if</span><span class="p">(</span><span class="o">!</span><span class="n">fp</span> <span class="o">||</span> <span class="o">!</span><span class="n">fp2</span><span class="p">)</span>
<span class="err">       </span> <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>
</pre></div>


<p>Next, we read values from both files: </p>
<div class="codehilite"><pre><span class="err">   </span> <span class="kt">int</span> <span class="n">magicNumber</span> <span class="o">=</span> <span class="n">readFlippedInteger</span><span class="p">(</span><span class="n">fp</span><span class="p">);</span>
<span class="err">   </span> <span class="kt">int</span> <span class="n">numImages</span> <span class="o">=</span> <span class="n">readFlippedInteger</span><span class="p">(</span><span class="n">fp</span><span class="p">);</span>

<span class="err">   </span> <span class="kt">int</span> <span class="n">numRows</span> <span class="o">=</span> <span class="n">readFlippedInteger</span><span class="p">(</span><span class="n">fp</span><span class="p">);</span>

<span class="err">   </span> <span class="kt">int</span> <span class="n">numCols</span> <span class="o">=</span> <span class="n">readFlippedInteger</span><span class="p">(</span><span class="n">fp</span><span class="p">);</span>

<span class="err">   </span> <span class="n">fseek</span><span class="p">(</span><span class="n">fp2</span><span class="p">,</span> <span class="mh">0x08</span><span class="p">,</span> <span class="n">SEEK_SET</span><span class="p">);</span>
</pre></div>


<p>We''ll get to the <code>readFlippedInteger</code> function a little later. If you''re on an Intel machine (which is little endian), you need to use it. If you''re on some other high-endian processor, you can simply read using fread.</p>
<p>Labels start at byte 8, so we also skip the first two integers (thus, 8 bytes) in fp2.</p>
<p>Now, we create memory to store all the images and labels: </p>
<div class="codehilite"><pre><span class="err">   </span> <span class="kt">int</span> <span class="n">size</span> <span class="o">=</span> <span class="n">numRows</span><span class="o">*</span><span class="n">numCols</span><span class="p">;</span>
<span class="err">   </span> <span class="n">CvMat</span> <span class="o">*</span><span class="n">trainingVectors</span> <span class="o">=</span> <span class="n">cvCreateMat</span><span class="p">(</span><span class="n">numImages</span><span class="p">,</span> <span class="n">size</span><span class="p">,</span> <span class="n">CV_32FC1</span><span class="p">);</span>
<span class="err">   </span> <span class="n">CvMat</span> <span class="o">*</span><span class="n">trainingLabels</span> <span class="o">=</span> <span class="n">cvCreateMat</span><span class="p">(</span><span class="n">numImages</span><span class="p">,</span> <span class="mi">1</span><span class="p">,</span> <span class="n">CV_32FC1</span><span class="p">);</span>
</pre></div>


<p>"vectors" refers to the images. Okay, so with memory in place, we read data from the files: </p>
<div class="codehilite"><pre><span class="err">   </span> <span class="n">BYTE</span> <span class="o">*</span><span class="n">temp</span> <span class="o">=</span> <span class="k">new</span> <span class="n">BYTE</span><span class="p">[</span><span class="n">size</span><span class="p">];</span>
<span class="err">   </span> <span class="n">BYTE</span> <span class="n">tempClass</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span>
<span class="err">   </span> <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">i</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">i</span><span class="o">&lt;</span><span class="n">numImages</span><span class="p">;</span><span class="n">i</span><span class="o">++</span><span class="p">)</span>
<span class="err">   </span> <span class="p">{</span>

<span class="err">       </span> <span class="n">fread</span><span class="p">((</span><span class="kt">void</span><span class="o">*</span><span class="p">)</span><span class="n">temp</span><span class="p">,</span> <span class="n">size</span><span class="p">,</span> <span class="mi">1</span><span class="p">,</span> <span class="n">fp</span><span class="p">);</span>

<span class="err">       </span> <span class="n">fread</span><span class="p">((</span><span class="kt">void</span><span class="o">*</span><span class="p">)(</span><span class="o">&amp;</span><span class="n">tempClass</span><span class="p">),</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">BYTE</span><span class="p">),</span> <span class="mi">1</span><span class="p">,</span> <span class="n">fp2</span><span class="p">);</span>

<span class="err">       </span> <span class="n">trainingLabels</span><span class="o">-&gt;</span><span class="n">data</span><span class="p">.</span><span class="n">fl</span><span class="p">[</span><span class="n">i</span><span class="p">]</span> <span class="o">=</span> <span class="n">tempClass</span><span class="p">;</span>

<span class="err">       </span> <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">k</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">k</span><span class="o">&lt;</span><span class="n">size</span><span class="p">;</span><span class="n">k</span><span class="o">++</span><span class="p">)</span>
<span class="err">           </span> <span class="n">trainingVectors</span><span class="o">-&gt;</span><span class="n">data</span><span class="p">.</span><span class="n">fl</span><span class="p">[</span><span class="n">i</span><span class="o">*</span><span class="n">size</span><span class="o">+</span><span class="n">k</span><span class="p">]</span> <span class="o">=</span> <span class="n">temp</span><span class="p">[</span><span class="n">k</span><span class="p">];</span>
<span class="err">   </span> <span class="p">}</span>
</pre></div>


<p>This code loads the i''th image into temp and its label into tempClass. And then, it fills appropriate elements in the trainingVectors and traingLabels matrices. Why? Because the matrices are floating point matrices. And the files have just single bytes. 4 bytes vs 1 byte does not match. So all the mess. If you know a better way to do this, please do let me know!</p>
<p>With all images and labels in the RAM, we can load these into the K-Nearest Neighbors algorithm: </p>
<div class="codehilite"><pre><span class="err">   </span> <span class="n">KNearest</span> <span class="n">knn</span><span class="p">(</span><span class="n">trainingVectors</span><span class="p">,</span> <span class="n">trainingLabels</span><span class="p">);</span>
</pre></div>


<p>And then, we can print out the maximum value of k. And we close both files. </p>
<div class="codehilite"><pre><span class="err">   </span> <span class="n">printf</span><span class="p">(</span><span class="s">&quot;Maximum k: %d&quot;</span><span class="p">,</span> <span class="n">knn</span><span class="p">.</span><span class="n">get_max_k</span><span class="p">());</span>

<span class="err">   </span> <span class="n">fclose</span><span class="p">(</span><span class="n">fp</span><span class="p">);</span>
<span class="err">   </span> <span class="n">fclose</span><span class="p">(</span><span class="n">fp2</span><span class="p">);</span>
</pre></div>


<p>We can also release the matrices. KNearest keeps its own copy of training vectors and classes. </p>
<div class="codehilite"><pre><span class="err">   </span> <span class="n">cvReleaseMat</span><span class="p">(</span><span class="o">&amp;</span><span class="n">trainingVectors</span><span class="p">);</span>
<span class="err">   </span> <span class="n">cvReleaseMat</span><span class="p">(</span><span class="o">&amp;</span><span class="n">trainingLabels</span><span class="p">);</span>
</pre></div>


<h2>Recognition: Using K-Nearest Neighbors</h2>
<p>We''ve trained the algorithm. Now its time to run it against test images and see how accurate it is.</p>
<p>We''ll continue in the same project. Add these lines at the bottom: </p>
<div class="codehilite"><pre><span class="err">   </span> <span class="n">fp</span> <span class="o">=</span> <span class="n">fopen</span><span class="p">(</span><span class="s">&quot;C:</span><span class="se">\\</span><span class="s">t10k-images.idx3-ubyte&quot;</span><span class="p">,</span> <span class="s">&quot;rb&quot;</span><span class="p">);</span>
<span class="err">   </span> <span class="n">fp2</span> <span class="o">=</span> <span class="n">fopen</span><span class="p">(</span><span class="s">&quot;C:</span><span class="se">\\</span><span class="s">t10k-labels.idx1-ubyte&quot;</span><span class="p">,</span> <span class="s">&quot;rb&quot;</span><span class="p">);</span>
</pre></div>


<p>Then we read initial information from these files and set the position of fp2 to the 8th byte: </p>
<div class="codehilite"><pre><span class="err">   </span> <span class="n">magicNumber</span> <span class="o">=</span> <span class="n">readFlippedInteger</span><span class="p">(</span><span class="n">fp</span><span class="p">);</span>
<span class="err">   </span> <span class="n">numImages</span> <span class="o">=</span> <span class="n">readFlippedInteger</span><span class="p">(</span><span class="n">fp</span><span class="p">);</span>
<span class="err">   </span> <span class="n">numRows</span> <span class="o">=</span> <span class="n">readFlippedInteger</span><span class="p">(</span><span class="n">fp</span><span class="p">);</span>

<span class="err">   </span> <span class="n">numCols</span> <span class="o">=</span> <span class="n">readFlippedInteger</span><span class="p">(</span><span class="n">fp</span><span class="p">);</span>

<span class="err">   </span> <span class="n">fseek</span><span class="p">(</span><span class="n">fp2</span><span class="p">,</span> <span class="mh">0x08</span><span class="p">,</span> <span class="n">SEEK_SET</span><span class="p">);</span>
</pre></div>


<p>Next, we allocate memory for all the images and labels stored in those files: </p>
<div class="codehilite"><pre><span class="err">   </span> <span class="n">CvMat</span> <span class="o">*</span><span class="n">testVectors</span> <span class="o">=</span> <span class="n">cvCreateMat</span><span class="p">(</span><span class="n">numImages</span><span class="p">,</span> <span class="n">size</span><span class="p">,</span> <span class="n">CV_32FC1</span><span class="p">);</span>
<span class="err">   </span> <span class="n">CvMat</span> <span class="o">*</span><span class="n">testLabels</span> <span class="o">=</span> <span class="n">cvCreateMat</span><span class="p">(</span><span class="n">numImages</span><span class="p">,</span> <span class="mi">1</span><span class="p">,</span> <span class="n">CV_32FC1</span><span class="p">);</span>
<span class="err">   </span> <span class="n">CvMat</span> <span class="o">*</span><span class="n">actualLabels</span> <span class="o">=</span> <span class="n">cvCreateMat</span><span class="p">(</span><span class="n">numImages</span><span class="p">,</span> <span class="mi">1</span><span class="p">,</span> <span class="n">CV_32FC1</span><span class="p">);</span>
</pre></div>


<p>testVectors store the actual image. testLabels store the label predicted by the algorithm. actualLabels stores the correct label (taken from the file fp2).</p>
<p>Then, we create some temporary variables: </p>
<div class="codehilite"><pre><span class="err">   </span> <span class="n">temp</span> <span class="o">=</span> <span class="k">new</span> <span class="n">BYTE</span><span class="p">[</span><span class="n">size</span><span class="p">];</span>
<span class="err">   </span> <span class="n">tempClass</span><span class="o">=</span><span class="mi">1</span><span class="p">;</span>
<span class="err">   </span> <span class="n">CvMat</span> <span class="o">*</span><span class="n">currentTest</span> <span class="o">=</span> <span class="n">cvCreateMat</span><span class="p">(</span><span class="mi">1</span><span class="p">,</span> <span class="n">size</span><span class="p">,</span> <span class="n">CV_32FC1</span><span class="p">);</span>
<span class="err">   </span> <span class="n">CvMat</span> <span class="o">*</span><span class="n">currentLabel</span> <span class="o">=</span> <span class="n">cvCreateMat</span><span class="p">(</span><span class="mi">1</span><span class="p">,</span> <span class="mi">1</span><span class="p">,</span> <span class="n">CV_32FC1</span><span class="p">);</span>
<span class="err">   </span> <span class="kt">int</span> <span class="n">totalCorrect</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span>
</pre></div>


<p>temp and tempClass hold  the current image and its actual label. totalCorrect keeps a track of correct predictions. Now, we iterate through all images in the file: </p>
<div class="codehilite"><pre><span class="err">   </span> <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">i</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">i</span><span class="o">&lt;</span><span class="n">numImages</span><span class="p">;</span><span class="n">i</span><span class="o">++</span><span class="p">)</span>
<span class="err">   </span> <span class="p">{</span>

<span class="err">       </span> <span class="n">fread</span><span class="p">((</span><span class="kt">void</span><span class="o">*</span><span class="p">)</span><span class="n">temp</span><span class="p">,</span> <span class="n">size</span><span class="p">,</span> <span class="mi">1</span><span class="p">,</span> <span class="n">fp</span><span class="p">);</span>

<span class="err">       </span> <span class="n">fread</span><span class="p">((</span><span class="kt">void</span><span class="o">*</span><span class="p">)(</span><span class="o">&amp;</span><span class="n">tempClass</span><span class="p">),</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">BYTE</span><span class="p">),</span> <span class="mi">1</span><span class="p">,</span> <span class="n">fp2</span><span class="p">);</span>

<span class="err">       </span> <span class="n">actualLabels</span><span class="o">-&gt;</span><span class="n">data</span><span class="p">.</span><span class="n">fl</span><span class="p">[</span><span class="n">i</span><span class="p">]</span> <span class="o">=</span> <span class="p">(</span><span class="kt">float</span><span class="p">)</span><span class="n">tempClass</span><span class="p">;</span>

<span class="err">       </span> <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">k</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">k</span><span class="o">&lt;</span><span class="n">size</span><span class="p">;</span><span class="n">k</span><span class="o">++</span><span class="p">)</span>
<span class="err">       </span> <span class="p">{</span>
<span class="err">           </span> <span class="n">testVectors</span><span class="o">-&gt;</span><span class="n">data</span><span class="p">.</span><span class="n">fl</span><span class="p">[</span><span class="n">i</span><span class="o">*</span><span class="n">size</span><span class="o">+</span><span class="n">k</span><span class="p">]</span> <span class="o">=</span> <span class="n">temp</span><span class="p">[</span><span class="n">k</span><span class="p">];</span>
<span class="err">           </span> <span class="n">currentTest</span><span class="o">-&gt;</span><span class="n">data</span><span class="p">.</span><span class="n">fl</span><span class="p">[</span><span class="n">k</span><span class="p">]</span> <span class="o">=</span> <span class="n">temp</span><span class="p">[</span><span class="n">k</span><span class="p">];</span>
<span class="err">       </span> <span class="p">}</span>
</pre></div>


<p>This simply reads an image and its label from the files and stores them in the matrices. Then we try to predict the label for this image: </p>
<div class="codehilite"><pre><span class="err"> </span> <span class="err">  </span> <span class="err">  </span> <span class="n">knn</span><span class="p">.</span><span class="n">find_nearest</span><span class="p">(</span><span class="n">currentTest</span><span class="p">,</span> <span class="mi">5</span><span class="p">,</span> <span class="n">currentLabel</span><span class="p">);</span>

<span class="err">       </span> <span class="n">testLabels</span><span class="o">-&gt;</span><span class="n">data</span><span class="p">.</span><span class="n">fl</span><span class="p">[</span><span class="n">i</span><span class="p">]</span> <span class="o">=</span> <span class="n">currentLabel</span><span class="o">-&gt;</span><span class="n">data</span><span class="p">.</span><span class="n">fl</span><span class="p">[</span><span class="mi">0</span><span class="p">];</span>

<span class="err">       </span> <span class="k">if</span><span class="p">(</span><span class="n">currentLabel</span><span class="o">-&gt;</span><span class="n">data</span><span class="p">.</span><span class="n">fl</span><span class="p">[</span><span class="mi">0</span><span class="p">]</span><span class="o">==</span><span class="n">actualLabels</span><span class="o">-&gt;</span><span class="n">data</span><span class="p">.</span><span class="n">fl</span><span class="p">[</span><span class="n">i</span><span class="p">])</span>
<span class="err">           </span> <span class="n">totalCorrect</span><span class="o">++</span><span class="p">;</span>
<span class="err">   </span> <span class="p">}</span>
</pre></div>


<p>Finally, we print the number of correct predictions: </p>
<div class="codehilite"><pre><span class="err">   </span> <span class="n">printf</span><span class="p">(</span><span class="s">&quot;Time: %d Accuracy: %f &quot;</span><span class="p">,</span> <span class="p">(</span><span class="kt">int</span><span class="p">)</span><span class="n">time</span><span class="p">,</span> <span class="p">(</span><span class="kt">double</span><span class="p">)</span><span class="n">totalCorrect</span><span class="o">*</span><span class="mi">100</span><span class="o">/</span><span class="p">(</span><span class="kt">double</span><span class="p">)</span><span class="n">numImages</span><span class="p">);</span>

<span class="err">   </span> <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>And this finishes our program.</p>
<h2>Flipped integers and Endian-ness</h2>
<p>Different processors have different Endian-ness. Suppose you have a 32-bit integer. So it''s stored over 4 bytes. Some processors read the most significant byte first. Others read the least significant byte first.</p>
<p>True, this just adds to confusion, but you can''t really control Intel or AMD.</p>
<p>Probably, the creates of the MNIST dataset have a non-Intel machine. So they''ve designed the file format that way. Here''s the code for reading a "flipped integer". </p>
<div class="codehilite"><pre><span class="kt">int</span> <span class="nf">readFlippedInteger</span><span class="p">(</span><span class="kt">FILE</span> <span class="o">*</span><span class="n">fp</span><span class="p">)</span>
<span class="p">{</span>
<span class="err">   </span> <span class="kt">int</span> <span class="n">ret</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span>

<span class="err">   </span> <span class="n">BYTE</span> <span class="o">*</span><span class="n">temp</span><span class="p">;</span>

<span class="err">   </span> <span class="n">temp</span> <span class="o">=</span> <span class="p">(</span><span class="n">BYTE</span><span class="o">*</span><span class="p">)(</span><span class="o">&amp;</span><span class="n">ret</span><span class="p">);</span>
<span class="err">   </span> <span class="n">fread</span><span class="p">(</span><span class="o">&amp;</span><span class="n">temp</span><span class="p">[</span><span class="mi">3</span><span class="p">],</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">BYTE</span><span class="p">),</span> <span class="mi">1</span><span class="p">,</span> <span class="n">fp</span><span class="p">);</span>
<span class="err">   </span> <span class="n">fread</span><span class="p">(</span><span class="o">&amp;</span><span class="n">temp</span><span class="p">[</span><span class="mi">2</span><span class="p">],</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">BYTE</span><span class="p">),</span> <span class="mi">1</span><span class="p">,</span> <span class="n">fp</span><span class="p">);</span>
<span class="err">   </span> <span class="n">fread</span><span class="p">(</span><span class="o">&amp;</span><span class="n">temp</span><span class="p">[</span><span class="mi">1</span><span class="p">],</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">BYTE</span><span class="p">),</span> <span class="mi">1</span><span class="p">,</span> <span class="n">fp</span><span class="p">);</span>

<span class="err">   </span> <span class="n">fread</span><span class="p">(</span><span class="o">&amp;</span><span class="n">temp</span><span class="p">[</span><span class="mi">0</span><span class="p">],</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">BYTE</span><span class="p">),</span> <span class="mi">1</span><span class="p">,</span> <span class="n">fp</span><span class="p">);</span>

<span class="err">   </span> <span class="k">return</span> <span class="n">ret</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>It creates a Byte pointer to an integer and then reads bytes accordingly. </p>
<h2>Fin</h2>
<p>And with that, you''ve just made a machine learn something! Of course, there are much better alternatives. See if you can find some algorithms. Or if you can improve this algorithm (hint: maybe not all pixels of an image are as important).</p>
<p>Enjoy!</p>','/static/img/tut/post-knearest-opencv.jpg','2010-10-05',1,3,'knearest-neighbors-in-opencv');
INSERT INTO "aishack_tutorial" VALUES('Color spaces','',16,'<h2>Introduction</h2>
<p>Images are stored in memory in various different colour spaces. You might have heard of one, the RGB colour space. That is the one Windows uses a lot. For image processing purposes, one often needs other colour spaces that better suit the purpose of the application.</p>
<p>In this article, I''ll go through the RGB and HSI colour spaces in detail, and briefly touch the Y''CbCr colour space too.</p>
<h2>Exactly how is an image stored?</h2>
<p>Before we get to the colour spaces, you need to know exactly how OpenCV (or any other program/API) stores images in the RAM.</p>
<h3>Grayscale images</h3>
<p>We''ll start simple... with a grayscale image. A grayscale picture just needs intensity information - how bright is a particular pixel. The higher the value, the greater the intensity. Current displays support 256 distinct shades of gray. Each one just a little bit lighter than the previous one!</p>
<figure><img alt="The grayscale palette" src="/static/img/tut/grayscale.jpg" />  <figcaption>
<p>The grayscale palette</p>
</figcaption>
</figure>
<p>So for a grayscale image, all you need is one single byte for each pixel. One byte (or 8-bits) can store a value from 0 to 255, and thus you''d cover all possible shades of gray.</p>
<p>So in the memory, a grayscale image is represented by a two dimensional array of bytes. The size of the array being equal to the height and width of the image. Technically, this array is a "channel". So, a grayscale image has only one channel. And this channel represents the intensity of whites. An example grayscale image:</p>
<figure><img alt="A grayscale image" src="/static/img/tut/grayscale_example.jpg" /><figcaption>
<p>A grayscale image</p>
</figcaption>
</figure>
<h3>Coloured images</h3>
<p>When colour is added, things get trickier. More information needs to be stored. Its no more just about what shade. Its about what shade of which "colour".</p>
<p>Non transparent image support 16,581,375 (that is around 16million) distinct colours. To be able to distinguish these different shades, you need 3 bytes for each pixel (3 bytes, or 24-bits, can store a value upto 255<em>255</em>255... which is equal to 16,581,375).</p>
<figure><img alt="A color image" src="/static/img/tut/colour_example.jpg" /><figcaption>
<p>A colour image</p>
</figcaption>
</figure>
<p>Now think about this: You have 16 million numbers to assign to different shades of colours. If you just randomly assigned colours to each number, things would get wierd. (say, 1=brightest red, 2=brightest green, 45780=dullest yellow, etc).</p>
<p>So people figured out different "colour spaces" to systematically assign numbers to the HUGE number of colours.</p>
<h2>Colour spaces</h2>
<h3>The RGB colour space</h3>
<p>We''ll start off simple, with the most common colour space: RGB. The 3 bytes of data for each pixel is split into 3 different parts: one byte for the amount of red, another for the amount of green and the third for the amount of blue.</p>
<p>Red, green and blue being primary colours can be mixed and different proportions to form any colour.</p>
<p>You have 256 different shades of red, green and blue (1 byte can store a value from 0 to 255). So you mix these colours in different proportions, and you get your desired colour. This colour space is quite intuitive. You''ve probably used it all the time without realizing what all was going on behind the scenes.</p>
<p>And since you''ve "dedicated" one byte of each pixel to red, the second byte to green and the last byte to blue... it makes sense to club these bytes together.</p>
<p>That is, all the "dedicated red" bytes together... the "dedicated green" bytes together at another place... and the blue ones at another location. And, behold, you get the red channel, the green channel and the blue channel!!</p>
<p>Here are some visuals that will explain this better:</p>
<figure><img alt="Color Spaces" src="/static/img/tut/colorspace_example.png" /><figcaption>
<p>The Original image</p>
</figcaption>
</figure>
<figure><img alt="The RGB Channels" src="/static/img/tut/rgb_channels.jpg" /><figcaption>
<p>Individual Channels</p>
</figcaption>
</figure>
<p>See the red, green and blue channels? The red regions have 0 "blue content". They''re pure red. And, the channels is a grayscale image (because each channel has 1-byte for each pixel).</p>','','2010-01-03',1,2,'color-spaces-1');
INSERT INTO "aishack_tutorial" VALUES('Color spaces 2','',17,'<p>Like I said on the <a href="/tutorials/color-spaces">previous article</a>, some colour spaces are good for some purposes. Other are good for other purposes.</p>
<p>RGB is good for humans. We can intuitively use it, and generate any colour we want. </p>
<p>But lets say you''re taking part in some image processing robotics competition (maybe, robocup). And you want your program to detect the position of your robots... you''ve probably put identity tags on top of them... something like this:</p>
<figure><img alt="The G.O.A.L. Arena" src="/static/img/tut/goal_arena.jpg" /><figcaption>
<p>A robotics arena</p>
</figcaption>
</figure>
<p>You can see the bots (red and blue, with white circles). And you want your program to identify their locations.</p>
<p>Your first idea would be something like: Take the red channel... and find out the regions with high intensity of red. Then, take the blue channel... and find out the regions with a high intensity of blue.</p>
<p>There are a few flaws in what you think: </p>
<ul>
<li>The "high intensity" regions won''t be uniform. They''ll vary because of factors you can''t control... like lighting, texture, etc</li>
<li>And what exactly does "high intensity" mean? Does it mean a value of red greater than 128? or 64?
You might have guess by now, using the RGB colour space for image processing is often tough. So the HSV colourspace was invented! </li>
</ul>
<h2>The HSV colour space</h2>
<p>The HSV colour space also has 3 channels: the Hue, the Saturation and the Value, or intensity.</p>
<p>The Hue channel represents the "colour". For example, "red" would be a colour. Light red/dark red would not be a colour.</p>
<p>The saturation channel is the "amount" of colour (this differentiates between a pale green and pure green). And intensity is the brightness of the colour (light green or dark green).</p>
<p>The visual below might help clarify what each channel represents:</p>
<figure><img alt="Color Spaces" src="/static/img/tut/colorspace_example.png" /><figcaption>
<p>The Original Image</p>
</figcaption>
</figure>
<figure><img alt="The Hue, Saturation and Value channels" src="/static/img/tut/hsv_channels.gif" /><figcaption>
<p>The 3 channels</p>
</figcaption>
</figure>
<p>As you can see in the Hue channel, each colour has its own "value"... the entire "red" is a single value, and also the green and blue. The lightness or darkness of the colour does not affect the hue channel. This channel is of immense use in image processing competitions where the quality of blue or green is quite bad (which is usually the case).</p>
<p>In the saturation channel, each pixel has a high intensity... meaning that each of the colours is completely saturated (and that is the case... the picture was generated using a software. If you used a real photograph, you''d get varied saturations throughout the image).</p>
<p>The intensity channel shows the brightness of the colour. From this channel, it appears that somehow the red colour''s intensity is a bit lower than the rest of the two colours. </p>
<h3>Using HSV in Matlab</h3>
<p>Matlab''s image processing toolbox comes with a function that converts a given RGB image into an HSV image: </p>
<div class="codehilite"><pre><span class="n">H</span> <span class="p">=</span> <span class="nb">rgb2hsv</span><span class="p">(</span><span class="n">img</span><span class="p">);</span>
</pre></div>


<p>Its as simple as that. </p>
<h3>Using HSV in OpenCV</h3>
<p>OpenCV also comes with a function that converts images between colour spaces: </p>
<div class="codehilite"><pre><span class="n">cvCvtColor</span><span class="p">(</span><span class="n">source</span><span class="p">,</span> <span class="n">destination</span><span class="p">,</span> <span class="n">conversion_code</span><span class="p">);</span>
</pre></div>


<p>Here, source is the image to be transformed. destination is where the transformed image will be stored and conversion_code specifies the type of conversion to be done (like CV_<srctype>2<desttype>) . In our case, it is CV_BGR2HSV. (I used a BGR because thats how OpenCV loads most images, yes BGR... not RGB). </p>
<h2>The Y''CrCb colour space</h2>
<p>I won''t go into the details of this colour space... But i''ll describe it briefly as an example of how different colour spaces are useful in different situations.</p>
<p>The Y''CrCb is quite useful considering the phosphor emission characteristics of newer CRT screens. And is hence used in televisions, HDTV, etc. Plus, two of the three channels can be highly compressed without much loss in detail in the final image. This helps save bandwidth. </p>
<p>The Y'' channel (luma) is basically the grayscale version of the original image. Human eye is more receptive to black and white images... so this channel isn''t compressed much. This preserves a lot of details. The Cr and Cb channels contain the colour information. They can be highly compressed.</p>
<p>Many variants of this colour space exist... each works great for some particular application. </p>
<h2>Conclusion</h2>
<p>In this two page article you learned about the RGB and HSV colour spaces in detail. You also got to know about how to convert images into other colour spaces in Matlab and OpenCV. And you also got a glimpse of the Y''CrCb colour space.</p>
<p>Hope you learned through this tutorial. If you have any ideas, suggestions or criticism, do leave comments below!</p>','','2010-01-03',1,2,'color-spaces-2');
INSERT INTO "aishack_tutorial" VALUES('Drawing Histograms in OpenCV','',18,'<p>Here we''ll be generating the levels histograms you see in Photoshop. You load an image and the R, G and B histograms are calculated and rendered. We''ll make a very flexible function which you can reuse in your own projects too. </p>
<h2>Loading and splitting the image</h2>
<p>First, create a new project. Include the standard OpenCV headers: </p>
<div class="codehilite"><pre><span class="cp">#include &lt;stdio.h&gt;</span>
<span class="cp">#include &lt;opencv.h&gt;</span>
</pre></div>


<p>Next, we get to the main function: </p>
<div class="codehilite"><pre><span class="kt">void</span> <span class="nf">main</span><span class="p">()</span>
<span class="p">{</span>
</pre></div>


<p>The first thing to do: load an image </p>
<div class="codehilite"><pre>    <span class="n">IplImage</span><span class="o">*</span> <span class="n">img</span> <span class="o">=</span> <span class="n">cvLoadImage</span><span class="p">(</span><span class="s">&quot;C:</span><span class="se">\\\\</span><span class="s">orangeman.jpg&quot;</span><span class="p">);</span>
</pre></div>


<p>Next, we create and initialize a histogram: </p>
<div class="codehilite"><pre>    <span class="kt">int</span> <span class="n">numBins</span> <span class="o">=</span> <span class="mi">256</span><span class="p">;</span>
    <span class="kt">float</span> <span class="n">range</span><span class="p">[]</span> <span class="o">=</span> <span class="p">{</span><span class="mi">0</span><span class="p">,</span> <span class="mi">255</span><span class="p">};</span>

    <span class="kt">float</span> <span class="o">*</span><span class="n">ranges</span><span class="p">[]</span> <span class="o">=</span> <span class="p">{</span> <span class="n">range</span> <span class="p">};</span>

    <span class="n">CvHistogram</span> <span class="o">*</span><span class="n">hist</span> <span class="o">=</span> <span class="n">cvCreateHist</span><span class="p">(</span><span class="mi">1</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">numBins</span><span class="p">,</span> <span class="n">CV_HIST_ARRAY</span><span class="p">,</span> <span class="n">ranges</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>
    <span class="n">cvClearHist</span><span class="p">(</span><span class="n">hist</span><span class="p">);</span>
</pre></div>


<p>Here, we''re creating a uniform 1-D histogram with 256 bins. We supply the range as 0-255. The <a href="/tutorials/histograms-with-inbuilt-functions-of-opencv/">cvCreateHist function</a> automatically divides this range into 256 bins.</p>
<p>Next, we split the original colour image into its channels. We allocate memory and use the cvSplit function to break it into constituent channels: </p>
<div class="codehilite"><pre>    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgRed</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvGetSize</span><span class="p">(</span><span class="n">img</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgGreen</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvGetSize</span><span class="p">(</span><span class="n">img</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>

    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgBlue</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvGetSize</span><span class="p">(</span><span class="n">img</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>

    <span class="n">cvSplit</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="n">imgBlue</span><span class="p">,</span> <span class="n">imgGreen</span><span class="p">,</span> <span class="n">imgRed</span><span class="p">,</span> <span class="nb">NULL</span><span class="p">);</span>
</pre></div>


<p>The BGR order in the cvSplit command is important. Usually when an image is loaded, this is how its stored in memory. </p>
<h2>Rendering histograms</h2>
<p>Using the red channel, we can calculate and draw its histogram: </p>
<div class="codehilite"><pre>    <span class="n">cvCalcHist</span><span class="p">(</span><span class="o">&amp;</span><span class="n">imgRed</span><span class="p">,</span> <span class="n">hist</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">0</span><span class="p">);</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgHistRed</span> <span class="o">=</span> <span class="n">DrawHistogram</span><span class="p">(</span><span class="n">hist</span><span class="p">);</span>
    <span class="n">cvClearHist</span><span class="p">(</span><span class="n">hist</span><span class="p">);</span>
</pre></div>


<p>The cvCalcHist function calculates the histogram for the image <em>imgRed</em> and stores it into <em>hist</em>. <em>imgHistRed</em> image holds the visual for the histogram. The <em>DrawHistogram</em> function draw it. We''ll get to it in a minute.</p>
<p>Finally, we clear the histogram. We''re done with the red channel, so we''ll reuse it for the green and blue channels too: </p>
<div class="codehilite"><pre>    <span class="n">cvCalcHist</span><span class="p">(</span><span class="o">&amp;</span><span class="n">imgGreen</span><span class="p">,</span> <span class="n">hist</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">0</span><span class="p">);</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgHistGreen</span> <span class="o">=</span> <span class="n">DrawHistogram</span><span class="p">(</span><span class="n">hist</span><span class="p">);</span>

    <span class="n">cvClearHist</span><span class="p">(</span><span class="n">hist</span><span class="p">);</span>

    <span class="n">cvCalcHist</span><span class="p">(</span><span class="o">&amp;</span><span class="n">imgBlue</span><span class="p">,</span> <span class="n">hist</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">0</span><span class="p">);</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgHistBlue</span> <span class="o">=</span> <span class="n">DrawHistogram</span><span class="p">(</span><span class="n">hist</span><span class="p">);</span>
    <span class="n">cvClearHist</span><span class="p">(</span><span class="n">hist</span><span class="p">);</span>
</pre></div>


<p>Then we display these histograms in their own little windows: </p>
<div class="codehilite"><pre>    <span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;Red&quot;</span><span class="p">);</span>
    <span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;Green&quot;</span><span class="p">);</span>

    <span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;Blue&quot;</span><span class="p">);</span>

    <span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;Red&quot;</span><span class="p">,</span> <span class="n">imgHistRed</span><span class="p">);</span>
    <span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;Green&quot;</span><span class="p">,</span> <span class="n">imgHistGreen</span><span class="p">);</span>

    <span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;Blue&quot;</span><span class="p">,</span> <span class="n">imgHistBlue</span><span class="p">);</span>

    <span class="n">cvWaitKey</span><span class="p">(</span><span class="mi">0</span><span class="p">);</span>
<span class="p">}</span>
</pre></div>


<p>The cvWaitKey ensures that the windows don''t close automatically. You need to press a key to continue. With that, the main function is done. Now we''ll create the <em>DrawHistogram</em> function. </p>
<h2>A function to draw histograms</h2>
<p>Begin by defining the parameters: </p>
<div class="codehilite"><pre><span class="n">IplImage</span><span class="o">*</span> <span class="nf">DrawHistogram</span><span class="p">(</span><span class="n">CvHistogram</span> <span class="o">*</span><span class="n">hist</span><span class="p">,</span> <span class="kt">float</span> <span class="n">scaleX</span><span class="o">=</span><span class="mi">1</span><span class="p">,</span> <span class="kt">float</span> <span class="n">scaleY</span><span class="o">=</span><span class="mi">1</span><span class="p">)</span> 
<span class="p">{</span>
</pre></div>


<p>The function takes one histgoram (that it needs to render) and the scale on the X and Y axes. By default the histogram size is 256x64. Using the scale factors, you can get whatever size you want.</p>
<p>The values in the histogram can be extremely varied. From values less than 0.1 to greater than 1000. We need to fit all these into an image with a finite number of pixels.</p>
<p>So we figure out the maximum value of the histogram. Using this maximum, we scale the other values so they fit into the vertical size of the image: </p>
<div class="codehilite"><pre>    <span class="kt">float</span> <span class="n">histMax</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span>
    <span class="n">cvGetMinMaxHistValue</span><span class="p">(</span><span class="n">hist</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">histMax</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">0</span><span class="p">);</span>
</pre></div>


<p>Next, we create and blank out an image of the desired size: </p>
<div class="codehilite"><pre>    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgHist</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvSize</span><span class="p">(</span><span class="mi">256</span><span class="o">*</span><span class="n">scaleX</span><span class="p">,</span> <span class="mi">64</span><span class="o">*</span><span class="n">scaleY</span><span class="p">),</span> <span class="mi">8</span> <span class="p">,</span><span class="mi">1</span><span class="p">);</span>
    <span class="n">cvZero</span><span class="p">(</span><span class="n">imgHist</span><span class="p">);</span>
</pre></div>


<p>Then, we go through all bins and render out the graphic: </p>
<div class="codehilite"><pre>    <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">i</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">i</span><span class="o">&lt;</span><span class="mi">255</span><span class="p">;</span><span class="n">i</span><span class="o">++</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="kt">float</span> <span class="n">histValue</span> <span class="o">=</span> <span class="n">cvQueryHistValue_1D</span><span class="p">(</span><span class="n">hist</span><span class="p">,</span> <span class="n">i</span><span class="p">);</span>

        <span class="kt">float</span> <span class="n">nextValue</span> <span class="o">=</span> <span class="n">cvQueryHistValue_1D</span><span class="p">(</span><span class="n">hist</span><span class="p">,</span> <span class="n">i</span><span class="o">+</span><span class="mi">1</span><span class="p">);</span>

        <span class="n">CvPoint</span> <span class="n">pt1</span> <span class="o">=</span> <span class="n">cvPoint</span><span class="p">(</span><span class="n">i</span><span class="o">*</span><span class="n">scaleX</span><span class="p">,</span> <span class="mi">64</span><span class="o">*</span><span class="n">scaleY</span><span class="p">);</span>
        <span class="n">CvPoint</span> <span class="n">pt2</span> <span class="o">=</span> <span class="n">cvPoint</span><span class="p">(</span><span class="n">i</span><span class="o">*</span><span class="n">scaleX</span><span class="o">+</span><span class="n">scaleX</span><span class="p">,</span> <span class="mi">64</span><span class="o">*</span><span class="n">scaleY</span><span class="p">);</span>
        <span class="n">CvPoint</span> <span class="n">pt3</span> <span class="o">=</span> <span class="n">cvPoint</span><span class="p">(</span><span class="n">i</span><span class="o">*</span><span class="n">scaleX</span><span class="o">+</span><span class="n">scaleX</span><span class="p">,</span> <span class="p">(</span><span class="mi">64</span><span class="o">-</span><span class="n">nextValue</span><span class="o">*</span><span class="mi">64</span><span class="o">/</span><span class="n">histMax</span><span class="p">)</span><span class="o">*</span><span class="n">scaleY</span><span class="p">);</span>

        <span class="n">CvPoint</span> <span class="n">pt4</span> <span class="o">=</span> <span class="n">cvPoint</span><span class="p">(</span><span class="n">i</span><span class="o">*</span><span class="n">scaleX</span><span class="p">,</span> <span class="p">(</span><span class="mi">64</span><span class="o">-</span><span class="n">histValue</span><span class="o">*</span><span class="mi">64</span><span class="o">/</span><span class="n">histMax</span><span class="p">)</span><span class="o">*</span><span class="n">scaleY</span><span class="p">);</span>

        <span class="kt">int</span> <span class="n">numPts</span> <span class="o">=</span> <span class="mi">5</span><span class="p">;</span>

        <span class="n">CvPoint</span> <span class="n">pts</span><span class="p">[]</span> <span class="o">=</span> <span class="p">{</span><span class="n">pt1</span><span class="p">,</span> <span class="n">pt2</span><span class="p">,</span> <span class="n">pt3</span><span class="p">,</span> <span class="n">pt4</span><span class="p">,</span> <span class="n">pt1</span><span class="p">};</span>

        <span class="n">cvFillConvexPoly</span><span class="p">(</span><span class="n">imgHist</span><span class="p">,</span> <span class="n">pts</span><span class="p">,</span> <span class="n">numPts</span><span class="p">,</span> <span class="n">cvScalar</span><span class="p">(</span><span class="mi">255</span><span class="p">));</span>
    <span class="p">}</span>
</pre></div>


<p>Finally, we return the image we created: </p>
<div class="codehilite"><pre>    <span class="k">return</span> <span class="n">imgHist</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>Two things to remember with this function. </p>
<ul>
<li>You''re allocating memory in the function. So no need to do it anywhere else</li>
<li>Since the memory is allocated withing the image and not released, you must ensure it gets released when its work is done</li>
</ul>
<h2>How the rendering works?</h2>
<p>To draw the histogram, the cvFillConvexPoly function is used. This function can draw filled polygons. You pass the array of points and the number of points along with the color and it does its job.</p>
<p><img alt="The polygon used to render the histogram" src="/static/img/tut/hist-rendering.jpg" />The points pt1...pt4 are calculated and this polygon is rendered using the cvFillConvexPoly function. This is done for every single bin.</p>
<p>This polygon method produces relatively better results than simply drawing a straight vertical line at the center of a bin. If you did  the latter, you''d get a result like the black part. With the polygon method, values "in-between" get rendered as well. </p>
<h2>Summary</h2>
<p>With this post, you have a handy function that you can use to render out any 1D histogram. Just make sure it is 1D and not a sparse histogram. I haven''t added any checks for that.</p>','/static/img/tut/post-drawing-histograms.jpg','2010-07-06',1,3,'drawing-histograms-in-opencv');
INSERT INTO "aishack_tutorial" VALUES('Histograms with functions of OpenCV','',19,'<p>If something is useful for computer vision, you''ll almost definitely find it in OpenCV. Histograms are no exception. And OpenCV comes with a rich set of functions to work with and manipulate histograms. </p>
<h2>Creating and Releasing</h2>
<p>Histograms are stored in the CvHistogram data structure: </p>
<div class="codehilite"><pre><span class="k">typedef</span> <span class="k">struct</span> <span class="n">CvHistogram</span>
<span class="p">{</span>
    <span class="kt">int</span> <span class="n">type</span><span class="p">;</span>
    <span class="n">CvArr</span><span class="o">*</span> <span class="n">bins</span><span class="p">;</span>
    <span class="kt">float</span> <span class="n">thresh</span><span class="p">[</span><span class="n">CV_MAX_DIM</span><span class="p">][</span><span class="mi">2</span><span class="p">];</span>   <span class="c1">// for uniform histograms</span>
    <span class="kt">float</span><span class="o">**</span> <span class="n">thresh2</span><span class="p">;</span>               <span class="c1">// for nonuniform histograms</span>
    <span class="n">CvMatND</span> <span class="n">mat</span><span class="p">;</span>                   <span class="c1">// embedded matrix header for array histograms</span>
<span class="p">}</span>
<span class="n">CvHistogram</span><span class="p">;</span>
</pre></div>


<p>To create a new histogram, use the cvCreateHist function: </p>
<div class="codehilite"><pre><span class="n">CvHistogram</span><span class="o">*</span> <span class="nf">cvCreateHist</span><span class="p">(</span><span class="kt">int</span> <span class="n">dims</span><span class="p">,</span>
                          <span class="kt">int</span><span class="o">*</span> <span class="n">sizes</span><span class="p">,</span>
                          <span class="kt">int</span> <span class="n">type</span><span class="p">,</span>
                          <span class="kt">float</span><span class="o">**</span> <span class="n">ranges</span> <span class="o">=</span> <span class="nb">NULL</span><span class="p">,</span>
                          <span class="kt">int</span> <span class="n">uniform</span> <span class="o">=</span> <span class="mi">1</span>
                      <span class="p">);</span>
</pre></div>


<p>Very simple to understand. Here''s what the parameters mean: </p>
<ul>
<li>dims: <a href="/tutorials/histograms-from-simplest-to-the-most-complex/">The number of dimensions</a></li>
<li>*sizes: This is an array with the same number of integers as the number of dimensions. Each integer specifies how many bins are created in each dimension.</li>
<li>type: Possible values include CV_HIST_SPARSE or CV_HIST_ARRAY (usually, you''ll want this one)</li>
<li>**ranges: A two dimensional array. It''s actual value depends on the next parameter, uniform <ul>
<li>If uniform=1, then you need to supply <strong>two floating point numbers per dimension</strong>. They are the starting and ending values of the range. Each bin is assigned a range based on these two values. (if you have 10 bins and you supply 0.0 and 10.0 in ranges, they you''ll have each bin correspond to 0.0…0.99, 1…1.99, 2…2.99, etc. The "subdivisions" are calculated automatically)</li>
<li>If uniform=0, then you need to supply <strong>N+1 floating point numbers per dimension</strong>. These are the starting and ending value for each bin. (If you have 10 bins, then you must supply 11 numbers, say a,b,c,d,e,f,g,h,I,j,k. Then bins correspond to a…b, b…c, c…d, etc)</li>
</ul>
</li>
<li>
<p>Uniform: If uniform is set to zero, the histogram is made non-uniform. For any non-zero value, the histogram is uniform.
In the cvCreateHist function, you can actually set ranges to NULL. But then you''ll have to set the ranges later on. You must do this with: </p>
<p>:::c++
void cvSetHistBinRanges(CvHistogram<em> hist,
                        float</em>* ranges,
                        int uniform = 1
                    );</p>
</li>
</ul>
<p>The function just sets the ranges for the histogram hist. The parameters work just as explained above.</p>
<p>Once you''re done with a histogram, it''s a good idea to release it from memory. Other programs could really use some extra free RAM. You do this with: </p>
<div class="codehilite"><pre><span class="kt">void</span> <span class="nf">cvReleaseHist</span><span class="p">(</span><span class="n">CvHistogram</span><span class="o">**</span> <span class="n">hist</span><span class="p">);</span>
</pre></div>


<p>This is similar to most <a href="/tutorials/opencv-memory-management/">other cvRelease type commands</a>. </p>
<h2>Utility functions</h2>
<h3>Reusing histograms</h3>
<p>If you''ve already made a histogram and want to reuse it, you need to set each of the bins to zero. This is done by "clearing" the histogram: </p>
<div class="codehilite"><pre><span class="kt">void</span> <span class="nf">cvClearHist</span><span class="p">(</span><span class="n">CvHistogram</span><span class="o">*</span> <span class="n">hist</span><span class="p">);</span>
</pre></div>


<h3>Loading histograms from an array</h3>
<p>If you already have an array and you want to convert it into a histogram, there''s another utility function. </p>
<div class="codehilite"><pre><span class="n">CvHistogram</span><span class="o">*</span> <span class="nf">cvMakeHistHeaderForArray</span><span class="p">(</span><span class="kt">int</span> <span class="n">dims</span><span class="p">,</span>
                                      <span class="kt">int</span><span class="o">*</span> <span class="n">sizes</span><span class="p">,</span>
                                      <span class="n">CvHistogram</span><span class="o">*</span> <span class="n">hist</span><span class="p">,</span>
                                      <span class="kt">float</span><span class="o">*</span> <span class="n">data</span><span class="p">,</span>
                                      <span class="kt">float</span><span class="o">**</span> <span class="n">ranges</span> <span class="o">=</span> <span class="nb">NULL</span><span class="p">,</span>
                                      <span class="kt">int</span> <span class="n">uniform</span> <span class="o">=</span> <span class="mi">1</span>
                                  <span class="p">);</span>
</pre></div>


<p>This is similar to the cvCreateHist function, so it should be easy to understand. Dims is the number of dimensions, sizes is the number of bins in each dimension. Hist is the histogram and data is the actual array. This array must have sizes[0]<em>sizes[1]</em>sizes[2]…*sizes[dims-1] number of values. Ranges and uniform have the same meaning as above.</p>
<p>There are two things to remember when using cvMakeHistHeaderForArray(): </p>
<ol>
<li>There is no "type" parameter. The histogram created is always CV_HIST_ARRAY</li>
<li>Since you''re using your own array for the histogram, you might not want to use cvReleaseHist. That would release your array when you don''t want to.</li>
</ol>
<h2>Summary</h2>
<p>With the cvCreateHist and cvMakeHistHeaderForArray, we''re technically capable of creating histograms in OpenCV now!</p>','/static/img/tut/post-histogram-inbuilt-opencv.jpg','2010-07-04',1,3,'histograms-with-functions-of-opencv');
INSERT INTO "aishack_tutorial" VALUES('Accessing Histogram Data','',20,'<p>If you couldn''t check what value is stored in each bin, a histogram would be useless &gt;.&lt; So here are two methods to access those bins, one easy and one a little hard. </p>
<h2>The easy way</h2>
<p>This one is super simple. </p>
<div class="codehilite"><pre><span class="kt">double</span> <span class="nf">cvQueryHistValue_1D</span><span class="p">(</span><span class="n">CvHistogram</span><span class="o">*</span> <span class="n">hist</span><span class="p">,</span>
                           <span class="kt">int</span> <span class="n">idx0</span>

                          <span class="p">);</span>

<span class="kt">double</span> <span class="nf">cvQueryHistValue_2D</span><span class="p">(</span><span class="n">CvHistogram</span><span class="o">*</span> <span class="n">hist</span><span class="p">,</span>
                           <span class="kt">int</span> <span class="n">idx0</span><span class="p">,</span>
                           <span class="kt">int</span> <span class="n">idx1</span>

                          <span class="p">);</span>

<span class="kt">double</span> <span class="nf">cvQueryHistValue_3D</span><span class="p">(</span><span class="n">CvHistogram</span><span class="o">*</span> <span class="n">hist</span><span class="p">,</span>
                           <span class="kt">int</span> <span class="n">idx0</span><span class="p">,</span>
                           <span class="kt">int</span> <span class="n">idx1</span><span class="p">,</span>
                           <span class="kt">int</span> <span class="n">idx2</span>

                          <span class="p">);</span>

<span class="kt">double</span> <span class="nf">cvQueryHistValue_nD</span><span class="p">(</span><span class="n">CvHistogram</span><span class="o">*</span> <span class="n">hist</span><span class="p">,</span>
                            <span class="kt">int</span><span class="o">*</span> <span class="n">idxN</span>

                           <span class="p">);</span>
</pre></div>


<p>Very straightforward. You supply the histogram and the index of the bin. The function returns the floating point value stored in that particular bin.</p>
<p>If you''re using a 1D, 2D or 3D histogram, you have predefined functions for it. If you''re using higher dimensional histograms (God help you :P) you must use the cvQueryHistValue_nD function. You must pass an array of integers containing the indices.</p>
<p>These fucntions are simple, but come with an extra overhead (they''re functions, not direct machine code). If you''re accessing the histogram a lot, you might want to try it the hard way: using pointers. </p>
<h2>Using pointers</h2>
<p>If you''re accessing several bins sequentially, the pointer method would be a lot faster. The address won''t need to be calculated again and again.</p>
<p>To get a pointer to a bin, you use one of these: </p>
<div class="codehilite"><pre><span class="kt">float</span><span class="o">*</span> <span class="nf">cvGetHistValue_1D</span><span class="p">(</span><span class="n">CvHistogram</span><span class="o">*</span> <span class="n">hist</span><span class="p">,</span>
                         <span class="kt">int</span> <span class="n">idx0</span>
                        <span class="p">);</span>
<span class="kt">float</span><span class="o">*</span> <span class="nf">cvGetHistValue_2D</span><span class="p">(</span><span class="n">CvHistogram</span><span class="o">*</span> <span class="n">hist</span><span class="p">,</span>
                         <span class="kt">int</span> <span class="n">idx0</span><span class="p">,</span>
                         <span class="kt">int</span> <span class="n">idx1</span>
                        <span class="p">);</span>
<span class="kt">float</span><span class="o">*</span> <span class="nf">cvGetHistValue_3D</span><span class="p">(</span><span class="n">CvHistogram</span><span class="o">*</span> <span class="n">hist</span><span class="p">,</span>
                         <span class="kt">int</span> <span class="n">idx0</span><span class="p">,</span>
                         <span class="kt">int</span> <span class="n">idx1</span><span class="p">,</span>
                         <span class="kt">int</span> <span class="n">idx2</span>
                        <span class="p">);</span>
<span class="kt">float</span><span class="o">*</span> <span class="nf">cvGetHistValue_nD</span><span class="p">(</span><span class="n">CvHistogram</span><span class="o">*</span> <span class="n">hist</span><span class="p">,</span>
                         <span class="kt">int</span><span class="o">*</span> <span class="n">idxN</span>
                        <span class="p">);</span>
</pre></div>


<p>Note that this is a pointer to the bin, <em>not</em> the bin''s value. You can do pointer math on these and move around the different bins. </p>
<h2>Sparse vs Dense Histograms</h2>
<p>Dense histograms are the more intuitive one.You have bins for every possible value. Generally, you use this for images.</p>
<p>Sparse Histograms don''t have a bin for every single value. Say the possible values are 0 to 2,147,483,648. But only 0.001% of these values actually exist in the data/image (and they are random). We can''t store every single bin in this case. The range of values is ENORMOUS! One histogram could eat your entire RAM!</p>
<p>So it wold be a good idea to just store those 0.001% bins. That is exactly what sparse histograms do. They keep an internal data structure that tracks which bins exist and which ones don''t.</p>
<p><strong>Note</strong>: In sparse histograms, the <code>cvGetHistValue*</code> functions creates a new bin (with value 0) if it does not exist. So for sparse histgorams, you wouldn''t want to just blatantly go through values using cvGetHistValue.</p>
<p><strong>Another Note</strong>: <code>cvQueryHist*</code> does not create bins like that. </p>
<h2>Summary</h2>
<p>The CvHistogram datastructure and the functions of OpenCV make it a breeze to get access (either to the value or to the pointer) of each of the bins! And if a histogram is sparse, cvGetHistValue* would create a bin if it doesn''t exist.</p>','/static/img/tut/post-accessing-histogram-data.jpg','2010-07-05',1,3,'accessing-histogram-data');
INSERT INTO "aishack_tutorial" VALUES('Histograms: From simplest to the most complex','',21,'<p>If you''ve used photoshop, you probably know what a histogram is. Even digital cameras have it these days. But a histogram isn''t just about the chart you see there. Histograms have several uses in various fields. In this post, we''ll have a look at histograms from a general perspective. </p>
<h2>The General Histogram</h2>
<p>A histogram is a series of bins. You can store one value in each bin. That''s it. Each bin "belongs" to range of values, say 0 to 10, 10 to 40, etc. So if some value X belongs to this range, something is added to this bin. The bins can be non-uniform if required. But usually people go for uniform width bins.</p>
<h2>The 1-D Histogram</h2>
<p>This is the one you''re most familiar with. Bins are usually like this: 0.00-0.99, 1.00-1.99 and so on. This way you effectively get a "discrete" histogram (1 goes into a bin, 45 goes into another, etc).</p>
<figure><img alt="A one dimensional histogram" src="/static/img/tut/hist-1d.jpg" /><figcaption>
<p>A one dimensional histogram</p>
</figcaption>
</figure>
<p>If you want, you can have wider bins too. The SIFT algorithm makes extensive use such histograms. It divides 360 degrees into 8 bins. So angles from 0-44.99 degrees go into one bin, 45-89.99 into the next, etc.</p>
<h2>The 2-D Histogram</h2>
<p>Again, relatively easy to understand. You can imagine this to be a 3D bar chart in Word. The range of bins now becomes two dimensional. For example: (0, 0)-(44.99, 44.99), etc</p>
<figure><img alt="A 2D histogram" src="/static/img/tut/hist-2d.jpg" /><figcaption>
<p>A 2D histogram</p>
</figcaption>
</figure>
<p>Something similar to this is used in the Hough transform. It is referred to as the accumulator cells, but ultimately they act like bins of a histogram.</p>
<h2>The 3-D Histogram</h2>
<p>Things start getting weird from this point on. Visualizing a 3D histogram is a bit harder. The bins are now distributed in 3D space. And because each bin itself has stores value, the 3D histogram is a 4D object (x,y,z,value of bin). And you probably already know humans aren''t that good at imagining 4D.</p>
<p>One way of visualizing it is to take a plane and pass it through the 3D space. That way, you fix one particular dimension and you can visualize the three that remain.</p>
<figure><img alt="Visualizing a 3D histogram" src="/static/img/tut/hist-3d.jpg" /><figcaption>
<p>Visualizing a 3D histogram</p>
</figcaption>
</figure>
<h2>The N-D Histogram</h2>
<p>Don''t even try visualizing this. Just think of it as an N dimensional array. That''s it. You supply an index (say (2,45,6,89,5,7,63,10,3745,125,10,88,55) ) and you get a value. </p>
<h2>Summary</h2>
<p>All this was pretty simple. But histograms can be immensely useful. All the way from correcting the "look" of an image to figuring out the gesture of a hand ;)</p>','/static/img/tut/post-histogram-simple-complex.jpg','2010-07-03',1,2,'histograms-from-simplest-to-the-most-complex');
INSERT INTO "aishack_tutorial" VALUES('Transparent image overlays in OpenCV','',22,'<p>Time for some fun! Today we''ll be creating an interesting program today. I''ll be referring to a few old posts I''ve done. The the final result will be you''ll see histograms of R, G and B on top of a live video feed. And they will be semi  transparent. Okay, so lets get started with this! </p>
<h2>Prerequisites</h2>
<p>For now, I''ll assume you''ve read these posts: </p>
<ul>
<li><strong><a href="/tutorials/drawing-histograms-in-opencv/">Drawing Histograms in OpenCV</a></strong> Here I go through a flexible function that will draw a histogram from any grayscale image you give it</li>
<li><strong>Some method of capturing live video</strong> I''ve discussed two ways here: one uses <a href="/tutorials/capturing-images/">OpenCV''s cvcam libraries</a> and the other uses <a href="/tutorials/capturing-images-with-directx/">DirectX to capture images using videoInput</a>.</li>
</ul>
<h2>The main function</h2>
<p>Lets get to the code now. Create a new project. First, add the standard OpenCV headers and the videoInput headers: </p>
<div class="codehilite"><pre><span class="cp">#include &lt;cv.h&gt;</span>

<span class="cp">#include &lt;highgui.h&gt;</span>

<span class="cp">#include &quot;videoInput.h&quot;</span>
</pre></div>


<p>Then, the main function:</p>
<div class="codehilite"><pre><span class="kt">void</span> <span class="nf">main</span><span class="p">()</span>
<span class="p">{</span>
</pre></div>


<p>I''ll use the videoInput method. It works on my computer. The functions of the internal libraries of OpenCV don''t work with my webcam for some reason (know why? let me know please). </p>
<div class="codehilite"><pre>    <span class="n">videoInput</span> <span class="n">VI</span><span class="p">;</span>
    <span class="kt">int</span> <span class="n">numDevices</span> <span class="o">=</span> <span class="n">VI</span><span class="p">.</span><span class="n">listDevices</span><span class="p">();</span>

    <span class="kt">int</span> <span class="n">device1</span><span class="o">=</span> <span class="mi">0</span><span class="p">;</span>

    <span class="c1">// Setup the capture</span>
    <span class="n">VI</span><span class="p">.</span><span class="n">setupDevice</span><span class="p">(</span><span class="n">device1</span><span class="p">);</span>
    <span class="kt">int</span> <span class="n">width</span> <span class="o">=</span> <span class="n">VI</span><span class="p">.</span><span class="n">getWidth</span><span class="p">(</span><span class="n">device1</span><span class="p">);</span>
    <span class="kt">int</span> <span class="n">height</span> <span class="o">=</span> <span class="n">VI</span><span class="p">.</span><span class="n">getHeight</span><span class="p">(</span><span class="n">device1</span><span class="p">);</span>
</pre></div>


<p>Then, we create an image that will hold the webcam''s live feed: </p>
<div class="codehilite"><pre>    <span class="n">IplImage</span><span class="o">*</span> <span class="n">img</span><span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvSize</span><span class="p">(</span><span class="n">width</span><span class="p">,</span> <span class="n">height</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">3</span><span class="p">);</span>
    <span class="kt">unsigned</span> <span class="kt">char</span><span class="o">*</span> <span class="n">yourBuffer</span> <span class="o">=</span> <span class="k">new</span> <span class="kt">unsigned</span> <span class="kt">char</span><span class="p">[</span><span class="n">VI</span><span class="p">.</span><span class="n">getSize</span><span class="p">(</span><span class="n">device1</span><span class="p">)];</span>
</pre></div>


<p>img will hold the image in OpenCV''s format. yourBuffer holds the image in videoInput format (raw bytes). We''ll be creating live histograms for the image, so we initialize a histogram structure. </p>
<div class="codehilite"><pre>    <span class="c1">// Variables to be used for the histgoram</span>
    <span class="kt">int</span> <span class="n">numBins</span> <span class="o">=</span> <span class="mi">256</span><span class="p">;</span>
    <span class="kt">float</span> <span class="n">range</span><span class="p">[]</span> <span class="o">=</span> <span class="p">{</span><span class="mi">0</span><span class="p">,</span> <span class="mi">255</span><span class="p">};</span>

    <span class="kt">float</span> <span class="o">*</span><span class="n">ranges</span><span class="p">[]</span> <span class="o">=</span> <span class="p">{</span> <span class="n">range</span> <span class="p">};</span>

    <span class="c1">// Initialize a histogram</span>
    <span class="n">CvHistogram</span> <span class="o">*</span><span class="n">hist</span> <span class="o">=</span> <span class="n">cvCreateHist</span><span class="p">(</span><span class="mi">1</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">numBins</span><span class="p">,</span> <span class="n">CV_HIST_ARRAY</span><span class="p">,</span> <span class="n">ranges</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>
    <span class="n">cvClearHist</span><span class="p">(</span><span class="n">hist</span><span class="p">);</span>
</pre></div>


<p>We''re creating a histogram with 256 bins, it is uniform and is one dimensional.</p>
<p>Next, we create a handy black image. You''ll see why this is needed in a minute: </p>
<div class="codehilite"><pre>    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgBlack</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvSize</span><span class="p">(</span><span class="mi">128</span><span class="p">,</span> <span class="mi">32</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>
    <span class="n">cvZero</span><span class="p">(</span><span class="n">imgBlack</span><span class="p">);</span>
</pre></div>


<p>Then we create some temporary images we''ll be needing: </p>
<div class="codehilite"><pre>    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgRed</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvGetSize</span><span class="p">(</span><span class="n">img</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgGreen</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvGetSize</span><span class="p">(</span><span class="n">img</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>

    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgBlue</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvGetSize</span><span class="p">(</span><span class="n">img</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>

    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgRedHist</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvSize</span><span class="p">(</span><span class="mi">128</span><span class="p">,</span> <span class="mi">32</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">3</span><span class="p">);</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgGreenHist</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvSize</span><span class="p">(</span><span class="mi">128</span><span class="p">,</span> <span class="mi">32</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">3</span><span class="p">);</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgBlueHist</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvSize</span><span class="p">(</span><span class="mi">128</span><span class="p">,</span> <span class="mi">32</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">3</span><span class="p">);</span>
</pre></div>


<p>The first three images will hold the red, green and blue of the captured frame. The next three images will hold the histograms.</p>
<p>Now we get into the loop. This loop constantly grabs new frames from your camera: </p>
<div class="codehilite"><pre>    <span class="k">while</span><span class="p">(</span><span class="mi">1</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="n">VI</span><span class="p">.</span><span class="n">getPixels</span><span class="p">(</span><span class="n">device1</span><span class="p">,</span> <span class="n">yourBuffer</span><span class="p">,</span> <span class="nb">false</span><span class="p">,</span> <span class="nb">false</span><span class="p">);</span>
        <span class="n">img</span><span class="o">-&gt;</span><span class="n">imageData</span> <span class="o">=</span> <span class="p">(</span><span class="kt">char</span><span class="o">*</span><span class="p">)</span><span class="n">yourBuffer</span><span class="p">;</span>
        <span class="n">cvConvertImage</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="n">img</span><span class="p">,</span> <span class="n">CV_CVTIMG_FLIP</span><span class="p">);</span>
</pre></div>


<p>The first line actually grabs the raw bytes. The second line associates these bytes with the OpenCV structure. Finally, we flip the image (because the image captured is upside down).</p>
<p>We split the image into constituent channels next: </p>
<div class="codehilite"><pre>        <span class="n">cvSplit</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="n">imgBlue</span><span class="p">,</span> <span class="n">imgGreen</span><span class="p">,</span> <span class="n">imgRed</span><span class="p">,</span> <span class="nb">NULL</span><span class="p">);</span>
</pre></div>


<p>Then, as in the Drawing Histograms in OpenCV post, we draw histograms for each channel: </p>
<div class="codehilite"><pre>        <span class="n">cvCalcHist</span><span class="p">(</span><span class="o">&amp;</span><span class="n">imgRed</span><span class="p">,</span> <span class="n">hist</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">0</span><span class="p">);</span><span class="err">  </span> <span class="err">   </span> <span class="err">   </span> <span class="err"> </span>  <span class="c1">// Calculate the histogram for red</span>
        <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgHistRedOnly</span> <span class="o">=</span> <span class="n">DrawHistogram</span><span class="p">(</span><span class="n">hist</span><span class="p">,</span> <span class="mf">0.5</span><span class="p">,</span> <span class="mf">0.5</span><span class="p">);</span><span class="err">  </span> <span class="err"> </span><span class="c1">// Draw it</span>

        <span class="n">cvClearHist</span><span class="p">(</span><span class="n">hist</span><span class="p">);</span><span class="err">  </span> <span class="err">   </span> <span class="err">   </span> <span class="err">   </span> <span class="err">   </span> <span class="err">   </span> <span class="err">   </span> <span class="err"> </span><span class="c1">// Clear the histgoram</span>

        <span class="n">cvCalcHist</span><span class="p">(</span><span class="o">&amp;</span><span class="n">imgGreen</span><span class="p">,</span> <span class="n">hist</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">0</span><span class="p">);</span><span class="err">  </span> <span class="err">   </span> <span class="err">   </span> <span class="err"> </span><span class="c1">// Reuse it to calculate histogram for green</span>
        <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgHistGreenOnly</span> <span class="o">=</span> <span class="n">DrawHistogram</span><span class="p">(</span><span class="n">hist</span><span class="p">,</span> <span class="mf">0.5</span><span class="p">,</span> <span class="mf">0.5</span><span class="p">);</span>

        <span class="n">cvClearHist</span><span class="p">(</span><span class="n">hist</span><span class="p">);</span>

        <span class="n">cvCalcHist</span><span class="p">(</span><span class="o">&amp;</span><span class="n">imgBlue</span><span class="p">,</span> <span class="n">hist</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">0</span><span class="p">);</span><span class="err">  </span> <span class="err">   </span> <span class="err">   </span> <span class="err"> </span><span class="c1">// And again for blue</span>
        <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgHistBlueOnly</span> <span class="o">=</span> <span class="n">DrawHistogram</span><span class="p">(</span><span class="n">hist</span><span class="p">,</span> <span class="mf">0.5</span><span class="p">,</span> <span class="mf">0.5</span><span class="p">);</span>
        <span class="n">cvClearHist</span><span class="p">(</span><span class="n">hist</span><span class="p">);</span>
</pre></div>


<p>Next, we zero out the previous frame''s histogram: </p>
<div class="codehilite"><pre>        <span class="n">cvZero</span><span class="p">(</span><span class="n">imgRedHist</span><span class="p">);</span>
        <span class="n">cvZero</span><span class="p">(</span><span class="n">imgGreenHist</span><span class="p">);</span>
        <span class="n">cvZero</span><span class="p">(</span><span class="n">imgBlueHist</span><span class="p">);</span>
</pre></div>


<p>Then, we merge the current histogram image into a 3 channel image. The DrawHistogram returns a single channel image. But because we want to overlay it onto a 3 channel image, we need to convert it into a 3 channel image: </p>
<div class="codehilite"><pre>        <span class="n">cvMerge</span><span class="p">(</span><span class="n">imgHistBlueOnly</span><span class="p">,</span> <span class="n">imgBlack</span><span class="p">,</span> <span class="n">imgBlack</span><span class="p">,</span> <span class="nb">NULL</span><span class="p">,</span> <span class="n">imgBlueHist</span><span class="p">);</span>
        <span class="n">cvMerge</span><span class="p">(</span><span class="n">imgBlack</span><span class="p">,</span> <span class="n">imgHistGreenOnly</span><span class="p">,</span> <span class="n">imgBlack</span><span class="p">,</span> <span class="nb">NULL</span><span class="p">,</span> <span class="n">imgGreenHist</span><span class="p">);</span>
        <span class="n">cvMerge</span><span class="p">(</span><span class="n">imgBlack</span><span class="p">,</span> <span class="n">imgBlack</span><span class="p">,</span> <span class="n">imgHistRedOnly</span><span class="p">,</span> <span class="nb">NULL</span><span class="p">,</span> <span class="n">imgRedHist</span><span class="p">);</span>
</pre></div>


<p>This is where the imgBlack images are useful. We use the histogram image (the one we got from DrawHistogram), put it into the appropriate channel and set the other channels to zero.</p>
<p>Finally, we overlay the images with transparency: </p>
<div class="codehilite"><pre>        <span class="n">OverlayImage</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="n">imgRedHist</span><span class="p">,</span> <span class="n">cvPoint</span><span class="p">(</span><span class="mi">485</span><span class="p">,</span> <span class="mi">24</span><span class="p">),</span> <span class="n">cvScalar</span><span class="p">(</span><span class="mf">0.5</span><span class="p">,</span><span class="mf">0.5</span><span class="p">,</span><span class="mf">0.5</span><span class="p">,</span><span class="mf">0.5</span><span class="p">),</span> <span class="n">cvScalar</span><span class="p">(</span><span class="mf">0.5</span><span class="p">,</span><span class="mf">0.5</span><span class="p">,</span><span class="mf">0.5</span><span class="p">,</span><span class="mf">0.5</span><span class="p">));</span>
        <span class="n">OverlayImage</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="n">imgGreenHist</span><span class="p">,</span> <span class="n">cvPoint</span><span class="p">(</span><span class="mi">485</span><span class="p">,</span> <span class="mi">76</span><span class="p">),</span> <span class="n">cvScalar</span><span class="p">(</span><span class="mf">0.5</span><span class="p">,</span><span class="mf">0.5</span><span class="p">,</span><span class="mf">0.5</span><span class="p">,</span><span class="mf">0.5</span><span class="p">),</span> <span class="n">cvScalar</span><span class="p">(</span><span class="mf">0.5</span><span class="p">,</span><span class="mf">0.5</span><span class="p">,</span><span class="mf">0.5</span><span class="p">,</span><span class="mf">0.5</span><span class="p">));</span>
        <span class="n">OverlayImage</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="n">imgBlueHist</span><span class="p">,</span> <span class="n">cvPoint</span><span class="p">(</span><span class="mi">485</span><span class="p">,</span> <span class="mi">128</span><span class="p">),</span> <span class="n">cvScalar</span><span class="p">(</span><span class="mf">0.5</span><span class="p">,</span><span class="mf">0.5</span><span class="p">,</span><span class="mf">0.5</span><span class="p">,</span><span class="mf">0.5</span><span class="p">),</span> <span class="n">cvScalar</span><span class="p">(</span><span class="mf">0.5</span><span class="p">,</span><span class="mf">0.5</span><span class="p">,</span><span class="mf">0.5</span><span class="p">,</span><span class="mf">0.5</span><span class="p">));</span>
</pre></div>


<p>We''ll get to this function in sometime. Those super long parameters actually mean something. And you''ll know what they mean when we get to it.</p>
<p>And finally, we display the image: </p>
<div class="codehilite"><pre>        <span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;Overlay&quot;</span><span class="p">,</span> <span class="n">img</span><span class="p">);</span>
</pre></div>


<p>Then, we wait for the user to press escape. If he does, we quit. Otherwise, the loop continues. Thus the main function ends. </p>
<div class="codehilite"><pre>        <span class="k">if</span><span class="p">(</span><span class="n">cvWaitKey</span><span class="p">(</span><span class="mi">15</span><span class="p">)</span><span class="o">==</span><span class="mi">27</span><span class="p">)</span> <span class="k">break</span><span class="p">;</span>
    <span class="p">}</span>
<span class="p">}</span>
</pre></div>


<h2>Drawing histograms</h2>
<p>Here''s the function to draw histograms. Just in case: </p>
<div class="codehilite"><pre><span class="c1">// A function to draw the histogram</span>
<span class="n">IplImage</span><span class="o">*</span> <span class="nf">DrawHistogram</span><span class="p">(</span><span class="n">CvHistogram</span> <span class="o">*</span><span class="n">hist</span><span class="p">,</span> <span class="kt">float</span> <span class="n">scaleX</span><span class="o">=</span><span class="mi">1</span><span class="p">,</span> <span class="kt">float</span> <span class="n">scaleY</span><span class="o">=</span><span class="mi">1</span><span class="p">)</span>
<span class="p">{</span>
    <span class="c1">// Find the maximum value of the histogram to scale</span>
    <span class="c1">// other values accordingly</span>
    <span class="kt">float</span> <span class="n">histMax</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span>

    <span class="n">cvGetMinMaxHistValue</span><span class="p">(</span><span class="n">hist</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">histMax</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">0</span><span class="p">);</span>

    <span class="c1">// Create a new blank image based on scaleX and scaleY</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgHist</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvSize</span><span class="p">(</span><span class="mi">256</span><span class="o">*</span><span class="n">scaleX</span><span class="p">,</span> <span class="mi">64</span><span class="o">*</span><span class="n">scaleY</span><span class="p">),</span> <span class="mi">8</span> <span class="p">,</span><span class="mi">1</span><span class="p">);</span>

    <span class="n">cvZero</span><span class="p">(</span><span class="n">imgHist</span><span class="p">);</span>

    <span class="c1">// Go through each bin</span>
    <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">i</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">i</span><span class="o">&lt;</span><span class="mi">255</span><span class="p">;</span><span class="n">i</span><span class="o">++</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="kt">float</span> <span class="n">histValue</span> <span class="o">=</span> <span class="n">cvQueryHistValue_1D</span><span class="p">(</span><span class="n">hist</span><span class="p">,</span> <span class="n">i</span><span class="p">);</span><span class="err">  </span> <span class="err">   </span> <span class="err"> </span><span class="c1">// Get value for the current bin...</span>

        <span class="kt">float</span> <span class="n">nextValue</span> <span class="o">=</span> <span class="n">cvQueryHistValue_1D</span><span class="p">(</span><span class="n">hist</span><span class="p">,</span> <span class="n">i</span><span class="o">+</span><span class="mi">1</span><span class="p">);</span><span class="err">  </span> <span class="err"> </span><span class="c1">// ... and the next bin</span>

        <span class="c1">// Calculate the four points of the polygon that these two</span>
        <span class="c1">// bins enclose</span>
        <span class="n">CvPoint</span> <span class="n">pt1</span> <span class="o">=</span> <span class="n">cvPoint</span><span class="p">(</span><span class="n">i</span><span class="o">*</span><span class="n">scaleX</span><span class="p">,</span> <span class="mi">64</span><span class="o">*</span><span class="n">scaleY</span><span class="p">);</span>
        <span class="n">CvPoint</span> <span class="n">pt2</span> <span class="o">=</span> <span class="n">cvPoint</span><span class="p">(</span><span class="n">i</span><span class="o">*</span><span class="n">scaleX</span><span class="o">+</span><span class="n">scaleX</span><span class="p">,</span> <span class="mi">64</span><span class="o">*</span><span class="n">scaleY</span><span class="p">);</span>
        <span class="n">CvPoint</span> <span class="n">pt3</span> <span class="o">=</span> <span class="n">cvPoint</span><span class="p">(</span><span class="n">i</span><span class="o">*</span><span class="n">scaleX</span><span class="o">+</span><span class="n">scaleX</span><span class="p">,</span> <span class="p">(</span><span class="mi">64</span><span class="o">-</span><span class="n">nextValue</span><span class="o">*</span><span class="mi">64</span><span class="o">/</span><span class="n">histMax</span><span class="p">)</span><span class="o">*</span><span class="n">scaleY</span><span class="p">);</span>

        <span class="n">CvPoint</span> <span class="n">pt4</span> <span class="o">=</span> <span class="n">cvPoint</span><span class="p">(</span><span class="n">i</span><span class="o">*</span><span class="n">scaleX</span><span class="p">,</span> <span class="p">(</span><span class="mi">64</span><span class="o">-</span><span class="n">histValue</span><span class="o">*</span><span class="mi">64</span><span class="o">/</span><span class="n">histMax</span><span class="p">)</span><span class="o">*</span><span class="n">scaleY</span><span class="p">);</span>

        <span class="c1">// A close convex polygon</span>
        <span class="kt">int</span> <span class="n">numPts</span> <span class="o">=</span> <span class="mi">5</span><span class="p">;</span>

        <span class="n">CvPoint</span> <span class="n">pts</span><span class="p">[]</span> <span class="o">=</span> <span class="p">{</span><span class="n">pt1</span><span class="p">,</span> <span class="n">pt2</span><span class="p">,</span> <span class="n">pt3</span><span class="p">,</span> <span class="n">pt4</span><span class="p">,</span> <span class="n">pt1</span><span class="p">};</span>

        <span class="c1">// Draw it to the image</span>
        <span class="n">cvFillConvexPoly</span><span class="p">(</span><span class="n">imgHist</span><span class="p">,</span> <span class="n">pts</span><span class="p">,</span> <span class="n">numPts</span><span class="p">,</span> <span class="n">cvScalar</span><span class="p">(</span><span class="mi">255</span><span class="p">));</span>

    <span class="p">}</span>

    <span class="c1">// Return it... make sure you delete it once you&#39;re done!</span>
    <span class="k">return</span> <span class="n">imgHist</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>I''ve gone through this function in detail in the Drawing Histograms in OpenCV post. </p>
<h2>Creating Overlays</h2>
<p>Now we get to the OverlayImage function. Start by creating the first line: </p>
<div class="codehilite"><pre><span class="kt">void</span> <span class="nf">OverlayImage</span><span class="p">(</span><span class="n">IplImage</span><span class="o">*</span> <span class="n">src</span><span class="p">,</span> <span class="n">IplImage</span><span class="o">*</span> <span class="n">overlay</span><span class="p">,</span> <span class="n">CvPoint</span> <span class="n">location</span><span class="p">,</span> <span class="n">CvScalar</span> <span class="n">S</span><span class="p">,</span> <span class="n">CvScalar</span> <span class="n">D</span><span class="p">)</span>

<span class="p">{</span>
</pre></div>


<p>This function takes the source image (<em>src</em>) and puts the image <em>overlay</em> on top of it. location is the position where the image must be put. <em>S</em> and <em>D</em> are blending coefficients.</p>
<p>When overlaying, you''re obviously replacing pixel values by other values. These values are computed by multiplying S and the RGB values at the source and adding to D*RGB Values in the overlay image.</p>
<p>To do this, we must iterate over the entire image to be overlaid: </p>
<div class="codehilite"><pre>    <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">x</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">xwidth</span><span class="p">;</span><span class="n">x</span><span class="o">++</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="k">if</span><span class="p">(</span><span class="n">x</span><span class="o">+</span><span class="n">location</span><span class="p">.</span><span class="n">x</span><span class="o">&gt;=</span><span class="n">src</span><span class="o">-&gt;</span><span class="n">width</span><span class="p">)</span> <span class="k">continue</span><span class="p">;</span>
        <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">y</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">yheight</span><span class="p">;</span><span class="n">y</span><span class="o">++</span><span class="p">)</span>
        <span class="p">{</span>
            <span class="k">if</span><span class="p">(</span><span class="n">y</span><span class="o">+</span><span class="n">location</span><span class="p">.</span><span class="n">y</span><span class="o">&gt;=</span><span class="n">src</span><span class="o">-&gt;</span><span class="n">height</span><span class="p">)</span> <span class="k">continue</span><span class="p">;</span>
</pre></div>


<p>The if statements keep the loops from going beyond the source image. Then, we get the pixel value at (x,y) in both <em>src _and _overlay</em>. </p>
<div class="codehilite"><pre>            <span class="n">CvScalar</span> <span class="n">source</span> <span class="o">=</span> <span class="n">cvGet2D</span><span class="p">(</span><span class="n">src</span><span class="p">,</span> <span class="n">y</span><span class="o">+</span><span class="n">location</span><span class="p">.</span><span class="n">y</span><span class="p">,</span> <span class="n">x</span><span class="o">+</span><span class="n">location</span><span class="p">.</span><span class="n">x</span><span class="p">);</span>
            <span class="n">CvScalar</span> <span class="n">over</span> <span class="o">=</span> <span class="n">cvGet2D</span><span class="p">(</span><span class="n">overlay</span><span class="p">,</span> <span class="n">y</span><span class="p">,</span> <span class="n">x</span><span class="p">);</span>
</pre></div>


<p>And we calculate the new "merged" pixel value: </p>
<div class="codehilite"><pre>            <span class="n">CvScalar</span> <span class="n">merged</span><span class="p">;</span>
            <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">i</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">i</span><span class="o">&lt;</span><span class="mi">4</span><span class="p">;</span><span class="n">i</span><span class="o">++</span><span class="p">)</span>
                <span class="n">merged</span><span class="p">.</span><span class="n">val</span><span class="p">[</span><span class="n">i</span><span class="p">]</span> <span class="o">=</span> <span class="p">(</span><span class="n">S</span><span class="p">.</span><span class="n">val</span><span class="p">[</span><span class="n">i</span><span class="p">]</span><span class="o">*</span><span class="n">source</span><span class="p">.</span><span class="n">val</span><span class="p">[</span><span class="n">i</span><span class="p">]</span><span class="o">+</span><span class="n">D</span><span class="p">.</span><span class="n">val</span><span class="p">[</span><span class="n">i</span><span class="p">]</span><span class="o">*</span><span class="n">over</span><span class="p">.</span><span class="n">val</span><span class="p">[</span><span class="n">i</span><span class="p">]);</span>
</pre></div>


<p>We set this as the next pixel value and that ends the function! </p>
<div class="codehilite"><pre>            <span class="n">cvSet2D</span><span class="p">(</span><span class="n">src</span><span class="p">,</span> <span class="n">y</span><span class="o">+</span><span class="n">location</span><span class="p">.</span><span class="n">y</span><span class="p">,</span> <span class="n">x</span><span class="o">+</span><span class="n">location</span><span class="p">.</span><span class="n">x</span><span class="p">,</span> <span class="n">merged</span><span class="p">);</span>
        <span class="p">}</span>
    <span class="p">}</span>
<span class="p">}</span>
</pre></div>


<p>Because <em>src</em> is a pointer, any changes made in the image will automatically be reflected in the main function. So we don''t need to return anything. </p>
<h2>Done!</h2>
<p>After linking the appropriate library files (Project Properties -&gt; Configuration Properties -&gt; Linker -&gt; Input) for OpenCV and videoInput, the program should compile. On running you''ll see live video and a histogram on the right.</p>
<p>Note: I assume that your webcam/camera will work at 640x480. If it doesn''t make sure you change the location parameter (I use cvPoint(485, 20), etc in this post). </p>
<h2>Play around with S and D</h2>
<p>Different sets of S and D produce different results. Here are a few that results that I got: </p>
<figure><img alt="50% transparency" src="/static/img/tut/transparent-1.jpg" /><figcaption>
<p>Standard 50% transparency; S = (0.5, 0.5, 0.5, 0.5) D = (0.5, 0.5, 0.5, 0.5)</p>
</figcaption>
</figure>
<figure><img alt="Black turns see through" src="/static/img/tut/transparent-2.jpg" /><figcaption>
<p>Black turns see through; S = (1,1,1,1) D = (1,1,1,1)</p>
</figcaption>
</figure>
<figure><img alt="No transparency" src="/static/img/tut/transparent-3.jpg" /><figcaption>
<p>No transparency. Simple copy paste; S = (0,0,0,0) D = (1,1,1,1)</p>
</figcaption>
</figure>
<figure><img alt="90% opacity" src="/static/img/tut/transparent-4.jpg" /><figcaption>
<p>10% transparent; S = (0.1, 0.1, 0.1, 0.1) D = (0.9, 0.9, 0.9, 0.9)</p>
</figcaption>
</figure>
<figure><img alt="90% transparent" src="/static/img/tut/transparent-5.jpg" /><figcaption>
<p>90% transparent; S = (0.9, 0.9, 0.9, 0.9) D = (0.1, 0.1, 0.1, 0.1)</p>
</figcaption>
</figure>
<p>Do you see a pattern? If you want x% transparency, you set S to x and D to 1-x. And try negative values too ;) Did you get some interesting results?</p>','/static/img/tut/post-transparency-opencv.jpg','2010-07-07',1,3,'transparent-image-overlays-in-opencv');
INSERT INTO "aishack_tutorial" VALUES('2D matrices with CvMat in OpenCV','',23,'<h2>Basics</h2>
<p>Creating a 2D matrix is very simple. You use the cvCreateMat function. It has the following prototype. The <em>rows _and _cols _parameters are self explanatory. And to create a 1D matrix, you set either _cols</em>=1 (a column matrix) or <em>rows</em>=1 (a row matrix).</p>
<p>The <em>type</em> parameter lets you choose from the large variety of formats. There''s a large number of predefined constants to help you remember. Their general form is: CV_<bitdepth>(S|U|F)C<numchannels>. </p>
<div class="codehilite"><pre><span class="n">CvMat</span><span class="o">*</span> <span class="nf">cvCreateMat</span> <span class="p">(</span><span class="kt">int</span> <span class="n">rows</span><span class="p">,</span> <span class="kt">int</span> <span class="n">cols</span><span class="p">,</span> <span class="kt">int</span> <span class="n">type</span><span class="p">);</span>
</pre></div>


<figure><img alt="" src="/static/img/tut/cvmat.jpg" /><figcaption>
<p>A matrix</p>
</figcaption>
</figure>
<ul>
<li>Bit depth can be 8, 16, 32 or 64 bits. This is the amount of memory for the single orange cell in the above picture.</li>
<li>S means signed integer, U means unsigned integer and F means floating point (decimal values)</li>
<li>You can have any number of channels</li>
</ul>
<p>Thus, CV_8UC3 is for 8 bit unsigned integer matrices with 3 channels. CV_32SC2 is for 32 bit signed integer matrices with 2 channels. CV_64FC1 is for 64 bit floating point matrices with a single channel.</p>
<p>Internally, the CvMat structure looks like this: </p>
<div class="codehilite"><pre><span class="k">typedef</span> <span class="k">struct</span> <span class="n">CvMat</span>
<span class="p">{</span>
    <span class="kt">int</span> <span class="n">type</span><span class="p">;</span>
    <span class="kt">int</span> <span class="n">step</span><span class="p">;</span>

    <span class="kt">int</span><span class="o">*</span> <span class="n">refcount</span><span class="p">;</span> <span class="cm">/* underlying data reference counter */</span>

    <span class="k">union</span>
    <span class="p">{</span>
        <span class="n">uchar</span><span class="o">*</span> <span class="n">ptr</span><span class="p">;</span>
        <span class="kt">short</span><span class="o">*</span> <span class="n">s</span><span class="p">;</span>
        <span class="kt">int</span><span class="o">*</span> <span class="n">i</span><span class="p">;</span>
        <span class="kt">float</span><span class="o">*</span> <span class="n">fl</span><span class="p">;</span>
        <span class="kt">double</span><span class="o">*</span> <span class="n">db</span><span class="p">;</span>

    <span class="p">}</span> <span class="n">data</span><span class="p">;</span>

    <span class="kt">int</span> <span class="n">rows</span><span class="p">;</span>
    <span class="kt">int</span> <span class="n">cols</span><span class="p">;</span>
<span class="p">}</span> <span class="n">CvMat</span><span class="p">;</span>
</pre></div>


<ul>
<li><em>type</em> is the same parameter _type _ORed with some more constants</li>
<li><em>step</em> is the size of a row in bytes</li>
<li><em>refcount</em> is for internal use only</li>
<li><em>data</em> is used to access elements of the matrix (we''ll get to it in a minute)</li>
<li><em>rows</em> is the number of rows</li>
<li><em>cols</em> is the number of columns</li>
</ul>
<h2>More functions</h2>
<p>The cvCreateMat function is equivalent to calling cvCreateMatHeader, and then calling cvCreateData. The "header" is the structure I just talked about, and the "data" is the actual memory where the matrix is stored. So, you can create matrix and not allocate data. That''s a really handy feature. It really puts you in control of managing memory through the program.</p>
<p>Once you''ve created a matrix, you can release it using the cvReleaseMat function. It''s important that you release whatever memory you allocate. Or you''ll end up with a program that leaks a lot of memory. Not good. </p>
<p>Another utility function is cvCloneMat. This function creates an exact copy of the matrix you supply. It duplicate the contents in memory, so both copies are independent of each other.</p>
<p>Here are the function prototypes for each of them: </p>
<div class="codehilite"><pre><span class="n">CvMat</span><span class="o">*</span> <span class="n">cvCreateMatHeader</span><span class="p">(</span><span class="kt">int</span> <span class="n">rows</span><span class="p">,</span> <span class="kt">int</span> <span class="n">cols</span><span class="p">,</span> <span class="kt">int</span> <span class="n">type</span><span class="p">)</span>
<span class="kt">void</span> <span class="n">cvCreateData</span><span class="p">(</span><span class="n">CvMat</span><span class="o">*</span><span class="p">)</span>
<span class="kt">void</span> <span class="n">cvReleaseMat</span><span class="p">(</span><span class="n">CvMat</span><span class="o">**</span><span class="p">)</span>
<span class="n">CvMat</span><span class="o">*</span> <span class="n">cvCloneMat</span><span class="p">(</span><span class="n">CvMat</span><span class="o">*</span><span class="p">)</span>
</pre></div>


<h2>Accessing data</h2>
<p>Well, you''ve made a matrix. Now you better know how to access whats in it! Here are some functions to do that: </p>
<div class="codehilite"><pre><span class="kt">double</span> <span class="n">cvGetReal1D</span><span class="p">(</span><span class="n">CvArr</span><span class="o">*</span> <span class="n">arr</span><span class="p">,</span> <span class="kt">int</span> <span class="n">idx0</span><span class="p">)</span>
<span class="kt">double</span> <span class="n">cvGetReal2D</span><span class="p">(</span><span class="n">CvArr</span><span class="o">*</span> <span class="n">arr</span><span class="p">,</span> <span class="kt">int</span> <span class="n">idx0</span><span class="p">,</span> <span class="kt">int</span> <span class="n">idx1</span><span class="p">)</span>
<span class="kt">double</span> <span class="n">cvGetReal3D</span><span class="p">(</span><span class="n">CvArr</span><span class="o">*</span> <span class="n">arr</span><span class="p">,</span> <span class="kt">int</span> <span class="n">idx0</span><span class="p">,</span> <span class="kt">int</span> <span class="n">idx1</span><span class="p">,</span> <span class="kt">int</span> <span class="n">idx2</span><span class="p">)</span>
<span class="kt">double</span> <span class="n">cvGetRealND</span><span class="p">(</span><span class="n">CvArr</span><span class="o">*</span> <span class="n">arr</span><span class="p">,</span> <span class="kt">int</span><span class="o">*</span> <span class="n">idx</span><span class="p">)</span>
</pre></div>


<p>Simple as that. You supply the indices, and you get the value at a particular element for a 1D, 2D, 3D or an N-dimensional matrix.</p>
<p>To set values in the matrix, you use a similar group of functions: </p>
<div class="codehilite"><pre><span class="kt">void</span> <span class="n">cvSetReal1D</span><span class="p">(</span><span class="n">CvArr</span><span class="o">*</span> <span class="n">arr</span><span class="p">,</span> <span class="kt">int</span> <span class="n">idx0</span><span class="p">,</span> <span class="kt">double</span> <span class="n">value</span><span class="p">)</span>
<span class="kt">void</span> <span class="n">cvSetReal2D</span><span class="p">(</span><span class="n">CvArr</span><span class="o">*</span> <span class="n">arr</span><span class="p">,</span> <span class="kt">int</span> <span class="n">idx0</span><span class="p">,</span> <span class="kt">int</span> <span class="n">idx1</span><span class="p">,</span> <span class="kt">double</span> <span class="n">value</span><span class="p">)</span>
<span class="kt">void</span> <span class="n">cvSetReal3D</span><span class="p">(</span><span class="n">CvArr</span><span class="o">*</span> <span class="n">arr</span><span class="p">,</span> <span class="kt">int</span> <span class="n">idx0</span><span class="p">,</span> <span class="kt">int</span> <span class="n">idx1</span><span class="p">,</span> <span class="kt">int</span> <span class="n">idx2</span><span class="p">,</span> <span class="kt">double</span> <span class="n">value</span><span class="p">)</span>
<span class="kt">void</span> <span class="n">cvSetRealND</span><span class="p">(</span><span class="n">CvArr</span><span class="o">*</span> <span class="n">arr</span><span class="p">,</span> <span class="kt">int</span><span class="o">*</span> <span class="n">idx</span><span class="p">,</span> <span class="kt">double</span> <span class="n">value</span><span class="p">)</span>
</pre></div>


<p>Yet another way of accessing data is using pointers. And, pointers are definitely more efficient than the functions above. The idea is to get the pointer to a particular location in the matrix, and then use pointer arithmetic to move around the matrix. </p>
<div class="codehilite"><pre><span class="n">uchar</span><span class="o">*</span> <span class="n">cvPtr1D</span><span class="p">(</span><span class="n">CvArr</span><span class="o">*</span> <span class="n">arr</span><span class="p">,</span> <span class="kt">int</span> <span class="n">idx0</span><span class="p">)</span>
<span class="n">uchar</span><span class="o">*</span> <span class="n">cvPtr2D</span><span class="p">(</span><span class="n">CvArr</span><span class="o">*</span> <span class="n">arr</span><span class="p">,</span> <span class="kt">int</span> <span class="n">idx0</span><span class="p">,</span> <span class="kt">int</span> <span class="n">idx1</span><span class="p">)</span>
<span class="n">uchar</span><span class="o">*</span> <span class="n">cvPtr3D</span><span class="p">(</span><span class="n">CvArr</span><span class="o">*</span> <span class="n">arr</span><span class="p">,</span> <span class="kt">int</span> <span class="n">idx0</span><span class="p">,</span> <span class="kt">int</span> <span class="n">idx1</span><span class="p">,</span> <span class="kt">int</span> <span class="n">idx2</span><span class="p">)</span>
<span class="n">uchar</span><span class="o">*</span> <span class="n">cvPtrND</span><span class="p">(</span><span class="n">CvArr</span><span class="o">*</span> <span class="n">arr</span><span class="p">,</span> <span class="kt">int</span> <span class="n">idx</span><span class="p">)</span>
</pre></div>


<p>With these you get the pointer. Do whatever you want. Set values, retrieve values, whatever!</p>
<p>Note that the parameters are <em>CvArr _pointers. So you can pass _CvMat</em> variables and also _IplImage _variables. You can check the reason for this in the article <a href="/tutorials/primitive-structures-in-opencv/">Primitive structures in OpenCV</a>.</p>
<h2>Caution with pointers</h2>
<p>Here are two things you need to take care of when using the cvPtr*D functions.</p>
<p>Warning #1: Channels are stored interleaved. That is, if you have a 3 channel matrix, say representing the RGB components of an image, then it will be stored as rgbrgbrgb. Make sure you take that into account when doing the pointer arithmetic.</p>
<p>Warning #2: Use the <em>step</em> data member. It stores the actual number of bytes taken up by a row. For processor efficiency reasons, the memory allocated is increased to the nearest 4 byte boundary. So, if the row width for a particular matrix is 33 bytes, it will be increased to 36 bytes. And <em>step</em> stores this "total" memory allocated to the row. So use it to move through rows.</p>','/static/img/tut/post-opencv.jpg','2010-03-27',1,3,'2d-matrices-with-cvmat-in-opencv');
INSERT INTO "aishack_tutorial" VALUES('OpenCV Memory Management','',24,'<p>If you''re new to OpenCV, you need to know exactly how to manage all the huge amounts of memory you''re using. C/C++ isn''t a garbage collected language (like Java), so you need to manually release memory as soon as its use is over. If you don''t, your program could use up hundreds of MBs of highly valuable RAM... and often even crash (out-of-memory errors?) It can be a daunting task to hunt exactly where memory needs to be released. So I''ve compiled this short list of places where you should look out for memory leaks. </p>
<h2>Create it, then Release it</h2>
<p>If you create something, make sure you release it before "returning". This is probably the very first thing you should check when fixing memory leak problems with OpenCV. For example, if you do a cvCreateImage, make sure you do a cvReleaseImage. There are many things you can create. Here are some functions that "create" and their corresponding "release" functions </p>
<ul>
<li>cvCreateImage - cvReleaseImage</li>
<li>cvCreateImageHeader - cvReleaseImageHeader</li>
<li>cvCreateMat - cvReleaseMat</li>
<li>cvCreateMatND - cvReleaseMatND</li>
<li>cvCreateData - cvReleaseData</li>
<li>cvCreateSparseMat - cvReleaseSparseMat</li>
<li>cvCreateMemStorage - cvReleaseMemStorage</li>
<li>cvCreateGraphScanner - cvReleaseGraphScanner</li>
<li>cvOpenFileStorage - cvReleaseFileStorage</li>
<li>cvAlloc - cvFree</li>
</ul>
<p>One warning though: If you create something and want to return it, don''t release it. Lets say a function that creates a checkerboard image and returns it. If you release the image before returning it, you''re freeing all memory that stores the image data. And when you try accessing memory that isn''t yours, you get a crash. </p>
<h2>Release returned structures</h2>
<p>This is the second thing you should check for. Often, once you return a structure (say, an image).. you forget about it. </p>
<h2>Multiple Memory Allocations</h2>
<p>This is the third thing you should check for: Allocating memory, and then changing the pointer itself. Here''s some example code: </p>
<div class="codehilite"><pre><span class="n">IplImage</span><span class="o">*</span> <span class="n">image</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">whatever</span><span class="p">);</span>
<span class="n">image</span> <span class="o">=</span> <span class="n">CreateCheckerBoard</span><span class="p">(</span><span class="n">whatever</span><span class="p">);</span>
<span class="p">...</span>
<span class="n">cvReleaseImage</span><span class="p">(</span><span class="o">&amp;</span><span class="n">image</span><span class="p">);</span>
</pre></div>


<p>This function creates a memory leak. First, you allocate some memory for image. Then, you call the function CreateCheckerBoard. This function itself creates new memory. And image now points to this new memory. The memory created in the first step is lost forever. No variable points to it. A memory leak. To fix this, you need to modify the code like this: </p>
<div class="codehilite"><pre><span class="n">IplImage</span><span class="o">*</span> <span class="n">image</span> <span class="o">=</span> <span class="nb">NULL</span><span class="p">;</span>
<span class="n">image</span> <span class="o">=</span> <span class="n">CreateCheckerBoard</span><span class="p">(</span><span class="n">whatever</span><span class="p">);</span>
<span class="p">...</span>
<span class="n">cvReleaseImage</span><span class="p">(</span><span class="o">&amp;</span><span class="n">image</span><span class="p">);</span>
</pre></div>


<h2>If you return a sequence, release its storage</h2>
<p>There are many instances where you use the CvSeq data structure. And often you might want to return this structure for further use. If you release its storage (a CvMemStorage structure) within the function itself, you''d free the memory where the sequence is stored. And then you''d try and access it in the calling function. Again, crash.</p>
<p>A temporary fix would be to just erasing the cvReleaseMemStorage statement... but that would mean lots of memory.</p>
<p>To fix this, you don''t release the memory in the function itself. You release it in the calling function like this: </p>
<div class="codehilite"><pre><span class="n">cvReleaseMemStorage</span><span class="p">(</span><span class="o">&amp;</span><span class="n">thesequence</span><span class="o">-</span><span class="p">;</span><span class="o">&gt;</span><span class="n">storage</span><span class="p">);</span>
</pre></div>


<p>storage is a member of the CvMemStorage structure that always points to the memory where its stored.</p>
<p>Again, this is just an example. There are more structures where a similar situation could arise. </p>
<h2>Dependence on other structures</h2>
<p>I quite recently discovered this memory leak. To explain this, I''ll use an example: Lets say you find out the contours of an image. OpenCV would return a "linked list" type structure called CvSeq. You decide to access the third element of this linked list. OpenCV returns a pointer to the third element. All going great till this moment.</p>
<p>Now you decide to save all the points of this contour (the third element) in a data structure of your own. Since this is an array of points, you do something like: </p>
<div class="codehilite"><pre><span class="n">mystructure</span><span class="o">-&gt;</span><span class="n">points</span> <span class="o">=</span> <span class="n">thirdcontour</span><span class="o">-&gt;</span><span class="n">points</span><span class="p">;</span>
</pre></div>


<p>You set the pointer to equal to the thirdcontour. This is the bug.</p>
<p>If you release the storage of the sequence (which you should), mystructure has a bad pointer. To fix this, allocate new memory to mystructure-&gt;points and then copy contents of thirdcontour-&gt;points... something like this: </p>
<div class="codehilite"><pre><span class="n">mystructure</span><span class="o">-&gt;</span><span class="n">points</span> <span class="o">=</span> <span class="p">(</span><span class="n">CvPoint</span><span class="o">*</span><span class="p">)</span><span class="n">malloc</span><span class="p">(</span><span class="k">sizeof</span><span class="p">(</span><span class="n">CvPoint</span><span class="p">)</span> <span class="o">*</span> <span class="n">thirdcontour</span><span class="o">-&gt;</span><span class="n">total</span><span class="p">);</span>
<span class="n">memcpy</span><span class="p">(</span><span class="n">mystructure</span><span class="o">-&gt;</span><span class="n">points</span><span class="p">,</span><span class="n">thirdcontour</span><span class="o">-&gt;</span><span class="n">points</span><span class="p">,</span><span class="k">sizeof</span><span class="p">(</span><span class="n">CvPoint</span><span class="p">)</span><span class="o">*</span><span class="n">thirdcontour</span><span class="o">-&gt;</span><span class="n">total</span><span class="p">);</span>
</pre></div>


<p>This creates new memory for your structure and then copies each element there. Once you''ve done this, you can release the storage of the sequence without fear :) </p>
<h2>Thats it for now</h2>
<p>These are the few memory leak problems I''ve encountered till now. Hope this list helped you fix the problem with your program :)</p>','/static/img/tut/post-opencv.jpg','2010-01-19',1,3,'opencv-memory-management');
INSERT INTO "aishack_tutorial" VALUES('Capturing images with DirectX','',25,'<p>The library that comes with OpenCV is rather limited. It supports only a few models of webcams/cameras. This can be inhibiting if you''re trying to work with some high quality camera. </p>
<p>DirectX is a much bigger thing (3D math + 3D audio + 3D graphics + input from joysticks/etc + loads of other things). One of the libraries in DirectX lets you access imaging hardware. And, DirectX supports a HUGE number of cameras. Rather, a huge number of <em>cameras</em> support DirectX.</p>
<p>And we''ll be using that to get images into our OpenCV programs. </p>
<h2>Gathering dependencies</h2>
<p>We won''t go into the details about how to use DirectX. That in itself would be another set of posts. So, we''ll use a different library, called VideoInput and use that to get the camera data.</p>
<p>You''ll need to download quite a bit of stuff for this to work. </p>
<p>First, you need the VideoInput library itself. So, go <a href="http://muonics.net/school/spring05/videoInput/">download the videoinput library</a> and extract the files.</p>
<p>Now because this library uses DirectX, you need some stuff. Here''s what all you need </p>
<ol>
<li><a href="http://www.microsoft.com/downloads/details.aspx?familyid=E15438AC-60BE-41BD-AA14-7F1E0F19CA0D&amp;displaylang=en">Microsoft Platform SDK for Windows Server 2003 R2</a></li>
<li><a href="http://www.microsoft.com/downloads/details.aspx?FamilyID=77960733-06e9-47ba-914a-844575031b81&amp;DisplayLang=en">The DirectX SDK</a> (obviously :P)</li>
<li><a href="http://www.microsoft.com/downloads/details.aspx?FamilyID=8af0afa9-1383-44b4-bc8b-7d6315212323&amp;DisplayLang=en">The DirectShow SDK</a></li>
</ol>
<p>As I write this post, I have these files downloaded: </p>
<ol>
<li>5.2.3790.2075.51.PlatformSDK_Svr2003R2_rtm.img (409 MB)</li>
<li>dxsdk_feb2005.exe (154MB)</li>
<li>dxsdk_feb2005_extras.exe (35.6 MB)</li>
<li>videoInput0.1995.zip (33.7 MB)</li>
</ol>
<h2>Getting things running</h2>
<ol>
<li>Mount the .img file for the PlatformSDK (using something like PowerISO)</li>
<li>Install the platform SDK</li>
<li>Install the DirectX SDK</li>
<li>The extracted files from the DirectX SDK extras go into the folder where you installed the DirectX SDK (just cut paste the extras folder)</li>
<li>Extract the VideoInput archive into some folder</li>
</ol>
<p>With all this done, we''re ready to start putting things together. So start Microsoft Visual Studio 2008 (or whatever IDE you use) and follow along.</p>
<p>Open up the Options dialog box:</p>
<p><img alt="" src="/static/img/tut/vc2k8_options.jpg" /></p>
<p>Next, open up the directories tab:</p>
<p><img alt="" src="/static/img/tut/vc2k8_directories.jpg" /></p>
<p>See the "Show directories for" drop down on the top right? For each of those we''ll add some files.</p>
<p><strong>Executable Files:</strong></p>
<div class="codehilite"><pre><span class="nl">C:</span><span class="err">\\</span><span class="n">Program</span> <span class="n">Files</span><span class="err">\\</span><span class="n">Microsoft</span> <span class="n">Platform</span> <span class="n">SDK</span> <span class="k">for</span> <span class="n">Windows</span> <span class="n">Server</span> <span class="mi">2003</span> <span class="n">R2</span><span class="err">\\</span><span class="n">Bin</span>
<span class="nl">C:</span><span class="err">\\</span><span class="n">Program</span> <span class="n">Files</span><span class="err">\\</span><span class="n">Microsoft</span> <span class="n">DirectX</span> <span class="mf">9.0</span> <span class="n">SDK</span> <span class="p">(</span><span class="n">February</span> <span class="mi">2005</span><span class="p">)</span><span class="err">\\</span><span class="n">Utilities</span><span class="err">\\</span><span class="n">Bin</span><span class="err">\\</span><span class="n">x86</span>
</pre></div>


<p><strong>Include Files:</strong></p>
<div class="codehilite"><pre><span class="nl">C:</span><span class="err">\\</span><span class="n">videoInput0</span><span class="mf">.1995</span><span class="err">\\</span><span class="n">videoInput0</span><span class="mf">.1995</span><span class="err">\\</span><span class="n">compiledLib</span><span class="err">\\</span><span class="n">compliedByVs2008</span><span class="err">\\</span><span class="n">include</span>
<span class="nl">C:</span><span class="err">\\</span><span class="n">Program</span> <span class="n">Files</span><span class="err">\\</span><span class="n">Microsoft</span> <span class="n">Platform</span> <span class="n">SDK</span> <span class="k">for</span> <span class="n">Windows</span> <span class="n">Server</span> <span class="mi">2003</span> <span class="n">R2</span><span class="err">\\</span><span class="n">Include</span>
<span class="nl">C:</span><span class="err">\\</span><span class="n">Program</span> <span class="n">Files</span><span class="err">\\</span><span class="n">Microsoft</span> <span class="n">Platform</span> <span class="n">SDK</span> <span class="k">for</span> <span class="n">Windows</span> <span class="n">Server</span> <span class="mi">2003</span> <span class="n">R2</span><span class="err">\\</span><span class="n">Include</span><span class="err">\\</span><span class="n">mfl</span>
<span class="nl">C:</span><span class="err">\\</span><span class="n">Program</span> <span class="n">Files</span><span class="err">\\</span><span class="n">Microsoft</span> <span class="n">Platform</span> <span class="n">SDK</span> <span class="k">for</span> <span class="n">Windows</span> <span class="n">Server</span> <span class="mi">2003</span> <span class="n">R2</span><span class="err">\\</span><span class="n">Include</span><span class="err">\\</span><span class="n">atl</span>
<span class="nl">C:</span><span class="err">\\</span><span class="n">Program</span> <span class="n">Files</span><span class="err">\\</span><span class="n">Microsoft</span> <span class="n">DirectX</span> <span class="mf">9.0</span> <span class="n">SDK</span> <span class="p">(</span><span class="n">February</span> <span class="mi">2005</span><span class="p">)</span><span class="err">\\</span><span class="n">Include</span>
<span class="nl">C:</span><span class="err">\\</span><span class="n">Program</span> <span class="n">Files</span><span class="err">\\</span><span class="n">Microsoft</span> <span class="n">DirectX</span> <span class="mf">9.0</span> <span class="n">SDK</span> <span class="p">(</span><span class="n">February</span> <span class="mi">2005</span><span class="p">)</span><span class="err">\\</span><span class="n">Extras</span><span class="err">\\</span><span class="n">DirectShow</span><span class="err">\\</span><span class="n">Include</span>
<span class="nl">C:</span><span class="err">\\</span><span class="n">Program</span> <span class="n">Files</span><span class="err">\\</span><span class="n">Microsoft</span> <span class="n">DirectX</span> <span class="mf">9.0</span> <span class="n">SDK</span> <span class="p">(</span><span class="n">February</span> <span class="mi">2005</span><span class="p">)</span><span class="err">\\</span><span class="n">Extras</span><span class="err">\\</span><span class="n">DirectShow</span><span class="err">\\</span><span class="n">Samples</span><span class="err">\\</span><span class="n">C</span><span class="o">++</span><span class="err">\\</span><span class="n">DirectShow</span><span class="err">\\</span><span class="n">BaseClasses</span>
</pre></div>


<p><strong>Library Files:</strong></p>
<div class="codehilite"><pre><span class="nl">C:</span><span class="err">\\</span><span class="n">videoInput0</span><span class="mf">.1995</span><span class="err">\\</span><span class="n">videoInput0</span><span class="mf">.1995</span><span class="err">\\</span><span class="n">compiledLib</span><span class="err">\\</span><span class="n">compiledByVS2008</span>
<span class="nl">C:</span><span class="err">\\</span><span class="n">Program</span> <span class="n">Files</span><span class="err">\\</span><span class="n">Microsoft</span> <span class="n">Platform</span> <span class="n">SDK</span> <span class="k">for</span> <span class="n">Windows</span> <span class="n">Server</span> <span class="mi">2003</span> <span class="n">R2</span><span class="err">\\</span><span class="n">Lib</span>
<span class="nl">C:</span><span class="err">\\</span><span class="n">Program</span> <span class="n">Files</span><span class="err">\\</span><span class="n">Microsoft</span> <span class="n">Platform</span> <span class="n">SDK</span> <span class="k">for</span> <span class="n">Windows</span> <span class="n">Server</span> <span class="mi">2003</span> <span class="n">R2</span><span class="err">\\</span><span class="n">Samples</span><span class="err">\\</span><span class="n">Multimedia</span><span class="err">\\</span><span class="n">DirectShow</span><span class="err">\\</span><span class="n">BaseClasses</span><span class="err">\\</span><span class="n">Debug_Unicode</span>
<span class="nl">C:</span><span class="err">\\</span><span class="n">Program</span> <span class="n">Files</span><span class="err">\\</span><span class="n">Microsoft</span> <span class="n">DirectX</span> <span class="mf">9.0</span> <span class="n">SDK</span> <span class="p">(</span><span class="n">February</span> <span class="mi">2005</span><span class="p">)</span><span class="err">\\</span><span class="n">Lib</span><span class="err">\\</span><span class="n">x86</span>
<span class="nl">C:</span><span class="err">\\</span><span class="n">Program</span> <span class="n">Files</span><span class="err">\\</span><span class="n">Microsoft</span> <span class="n">DirectX</span> <span class="mf">9.0</span> <span class="n">SDK</span> <span class="p">(</span><span class="n">February</span> <span class="mi">2005</span><span class="p">)</span><span class="err">\\</span><span class="n">Extras</span><span class="err">\\</span><span class="n">DirectShow</span><span class="err">\\</span><span class="n">Lib</span><span class="err">\\</span><span class="n">x86</span>
<span class="nl">C:</span><span class="err">\\</span><span class="n">Program</span> <span class="n">Files</span><span class="err">\\</span><span class="n">Microsoft</span> <span class="n">DirectX</span> <span class="mf">9.0</span> <span class="n">SDK</span> <span class="p">(</span><span class="n">February</span> <span class="mi">2005</span><span class="p">)</span><span class="err">\\</span><span class="n">Extras</span><span class="err">\\</span><span class="n">DirectShow</span><span class="err">\\</span><span class="n">Samples</span><span class="err">\\</span><span class="n">C</span><span class="o">++</span><span class="err">\\</span><span class="n">DirectShow</span><span class="err">\\</span><span class="n">BaseClasses</span><span class="err">\\</span><span class="n">Debug_Unicode</span>
</pre></div>


<p>With these settings done, we should be able to grab frames from the camera through DirectX. </p>
<h2>Building Libraries</h2>
<p>The DirectShow SDK is just source code. It comes with pre-built stuff. That would increase filesize. So the good people of Microsoft shifted the burden of building their libraries onto us.</p>
<p>Go here: </p>
<div class="codehilite"><pre><span class="nl">C:</span><span class="err">\\</span><span class="n">Program</span> <span class="n">Files</span><span class="err">\\</span><span class="n">Microsoft</span> <span class="n">DirectX</span> <span class="mf">9.0</span> <span class="n">SDK</span> <span class="p">(</span><span class="n">February</span> <span class="mi">2005</span><span class="p">)</span><span class="err">\\</span><span class="n">Extras</span><span class="err">\\</span><span class="n">DirectShow</span><span class="err">\\</span><span class="n">Samples</span><span class="err">\\</span><span class="n">C</span><span class="o">++</span><span class="err">\\</span><span class="n">DirectShow</span><span class="err">\\</span><span class="n">BaseClasses</span><span class="err">\</span>\
</pre></div>


<p>You should see a solution file. Open that in Visual Studio. We need to build this solution to get all the files we need. Try building it as it is.</p>
<p>You would probably get some errors. If you get a linker error C2146 for winnt.h or error C4430 in ctlutil.h the problem here is that this member operator function does not have a return type: </p>
<div class="codehilite"><pre><span class="k">operator</span><span class="o">=</span><span class="p">(</span><span class="n">LONG</span><span class="p">);</span>
</pre></div>


<p>Change it to: </p>
<div class="codehilite"><pre><span class="n">COARefTime</span><span class="o">&amp;</span> <span class="k">operator</span><span class="o">=</span><span class="p">(</span><span class="n">LONG</span><span class="p">);</span>
</pre></div>


<p>If you want, you can <a href="http://forums.microsoft.com/MSDN/ShowPost.aspx?PostID=63785&amp;SiteID=1">read more about it over here</a>.</p>
<p>Next, we need to make sure that it <strong>becomes a static library</strong>. To do that, Go to: Project Settings -&gt; Librarian -&gt; General and set <em>Additional Dependencies</em> to "dxguid.lib ole32.lib  strmiids.lib uuid.lib", without the quotes. And also set <em>Link Library Dependencies</em> to Yes.</p>
<p>If you still get some errors, they''re probably about variables not being declared. Maybe a variable named Count, a static variable that needs a type (set its type to int), and iDone. These errors occur mostly because of for loops. So declaring them outside the for loop should be enough.</p>
<p>Once you''ve successfully built the solution (maybe with lots of warnings... but they don''t matter)... we''re done.</p>
<p>We now have all files required to capture from DirectX (using the DirectX library).</p>
<h2>A sample project</h2>
<p>With everything done, I''ll show a little demo of how to get frames from the videoinput library.</p>
<p>Create a new Win32 Project. Name it whatever you want, and accept the default settings.</p>
<p>In the main file of the project, we write the following code: </p>
<div class="codehilite"><pre><span class="cp">#include &quot;stdafx.h&quot;</span>
<span class="cp">#include &quot;videoInput.h&quot;</span>
<span class="cp">#include &quot;cv.h&quot;</span>

<span class="cp">#include &quot;highgui.h&quot;</span>

<span class="kt">int</span> <span class="nf">main</span><span class="p">()</span>
<span class="p">{</span>
    <span class="n">videoInput</span> <span class="n">VI</span><span class="p">;</span>
    <span class="kt">int</span> <span class="n">numDevices</span> <span class="o">=</span> <span class="n">VI</span><span class="p">.</span><span class="n">listDevices</span><span class="p">();</span>
    <span class="kt">int</span> <span class="n">device1</span><span class="o">=</span> <span class="mi">0</span><span class="p">;</span>
    <span class="n">VI</span><span class="p">.</span><span class="n">setupDevice</span><span class="p">(</span><span class="n">device1</span><span class="p">);</span>
    <span class="kt">int</span> <span class="n">width</span> <span class="o">=</span> <span class="n">VI</span><span class="p">.</span><span class="n">getWidth</span><span class="p">(</span><span class="n">device1</span><span class="p">);</span>
    <span class="kt">int</span> <span class="n">height</span> <span class="o">=</span> <span class="n">VI</span><span class="p">.</span><span class="n">getHeight</span><span class="p">(</span><span class="n">device1</span><span class="p">);</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">image</span><span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvSize</span><span class="p">(</span><span class="n">width</span><span class="p">,</span> <span class="n">height</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">3</span><span class="p">);</span>
    <span class="kt">unsigned</span> <span class="kt">char</span><span class="o">*</span> <span class="n">yourBuffer</span> <span class="o">=</span> <span class="k">new</span> <span class="kt">unsigned</span> <span class="kt">char</span><span class="p">[</span><span class="n">VI</span><span class="p">.</span><span class="n">getSize</span><span class="p">(</span><span class="n">device1</span><span class="p">)];</span>
    <span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;test&quot;</span><span class="p">);</span>
    <span class="k">while</span><span class="p">(</span><span class="mi">1</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="n">VI</span><span class="p">.</span><span class="n">getPixels</span><span class="p">(</span><span class="n">device1</span><span class="p">,</span> <span class="n">yourBuffer</span><span class="p">,</span> <span class="nb">false</span><span class="p">,</span> <span class="nb">false</span><span class="p">);</span>
        <span class="n">image</span><span class="o">-&gt;</span><span class="n">imageData</span> <span class="o">=</span> <span class="p">(</span><span class="kt">char</span><span class="o">*</span><span class="p">)</span><span class="n">yourBuffer</span><span class="p">;</span>
        <span class="n">cvConvertImage</span><span class="p">(</span><span class="n">image</span><span class="p">,</span> <span class="n">image</span><span class="p">,</span> <span class="n">CV_CVTIMG_FLIP</span><span class="p">);</span>
        <span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;test&quot;</span><span class="p">,</span> <span class="n">image</span><span class="p">);</span>
        <span class="k">if</span><span class="p">(</span><span class="n">cvWaitKey</span><span class="p">(</span><span class="mi">15</span><span class="p">)</span><span class="o">==</span><span class="mi">27</span><span class="p">)</span> <span class="k">break</span><span class="p">;</span>

    <span class="p">}</span>

    <span class="n">VI</span><span class="p">.</span><span class="n">stopDevice</span><span class="p">(</span><span class="n">device1</span><span class="p">);</span>
    <span class="n">cvDestroyWindow</span><span class="p">(</span><span class="s">&quot;test&quot;</span><span class="p">);</span>

    <span class="n">cvReleaseImage</span><span class="p">(</span><span class="o">&amp;</span><span class="n">image</span><span class="p">);</span>

    <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>

<span class="p">}</span>
</pre></div>


<p>Go to Project Properties -&gt; Confuguration Properties -&gt; Linker -&gt; Input and add videoinput.lib along with the usual OpenCV library files.</p>
<p>Then try compiling this code. It should work perfectly and you should see a live video from the first camera the program detects.</p>
<p>If you get errors about some library names atlthunk.lib, you have two options: </p>
<ul>
<li>Go to Project Settings -&gt; Linker -&gt; Command Line and Add /NODEFAULTLIB:"atlthunk"
Or </li>
<li>A little hack that works perfectly! Take a random .lib file, and rename it to atlthunk.lib. Place it in one of the Library directories we had added above.</li>
</ul>
<h2>Conclusion</h2>
<p>With this, you''ve got access to all those cameras that you bought, but packed them up because OpenCV didn''t "support" them. They should all work now. Enjoy!</p>','/static/img/tut/post-capturing-images-directx.jpg','2010-03-01',1,3,'capturing-images-with-directx');
INSERT INTO "aishack_tutorial" VALUES('Memory layout of matrices of multi-dimensional objects','',26,'<p>To be able to efficiently access multi-dimensional objects stored in matrices, you need to know how it''s stored in the memory. How are stored in the memory depends on the format of matrix you choose. This can lead to untraceable bugs, unless you know exactly how its done and how to make way around it! </p>
<h2>An example</h2>
<p>Lets take the example of a matrix storing <em>n</em> 3D points. There are four ways of doing this: </p>
<ul>
<li>n rows, 1 column, 3 channels (top left)</li>
<li>1 row, n columns, 3 channels (top right)</li>
<li>n rows, 3 columns, 1 channel (bottom left)</li>
<li>3 rows, n columns, 1 channel (bottom right)</li>
</ul>
<p>Here''s a graphical way of looking at it:</p>
<p><img alt="" src="/static/img/tut/matrix-memory-simple.jpg" /></p>
<p><img alt="" src="/static/img/tut/matrix-memory-complex.jpg" /></p>
<p>Now how are these stored in memory? Two key things to remember: </p>
<ul>
<li>Things get stored from left to right, top to bottom</li>
<li>Channels are always interleaved
Based on these two "rules", here''s what the first one would look like: </li>
</ul>
<figure><img alt="" src="/static/img/tut/matrix-memory-normal.jpg" /><figcaption>
<p>An example layout</p>
</figcaption>
</figure>
<p>This is the n rows, 1 column, 3 channels matrix in memory. The first triplet (x, y, z) belongs to row 1. The channels are interleaved, so you get those three values next to each other in memory. Next comes row 2, and so on.
  * 1 row, n columns, 3 channels would have the same layout in memory. The first triplet would be from column 1. The second from column 2, and so on. Again, channels are interleaved, so you end up getting all channels before the next column.
  * n rows, 3 columns, 1 channel would also have the same layout. There are no channels, so you just move from top to bottom. And you get the triplets again.</p>
<p>For 3 rows, n columns, 1 channel, the layout is <strong>different</strong>.</p>
<p><img alt="" src="/static/img/tut/matrix-memory-odd.jpg" /></p>
<p>In this case, you travel from left to right and top to bottom in the matrix. Since there are no channels, that''s the only rule you follow. So you end up with all x''s together, y''s together and the z''s together. Completely unlike the three other matrix formats. </p>
<h2>The general rule</h2>
<p>In order to access a particular element on a matrix, here''s the "formula" for the offest: </p>
<div class="codehilite"><pre><span class="n">offset</span> <span class="o">=</span> <span class="p">(</span><span class="n">row</span> <span class="o">*</span> <span class="n">numCols</span> <span class="o">*</span> <span class="n">numChannels</span><span class="p">)</span> <span class="o">+</span> <span class="p">(</span><span class="n">col</span> <span class="o">*</span> <span class="n">numChannels</span><span class="p">)</span> <span class="o">+</span> <span class="p">(</span><span class="n">channel</span><span class="p">)</span>
</pre></div>


<p>Here, <em>row</em>, <em>col</em> and <em>channel</em> are the row, column and channel of the matrix you wish to access. <em>numCols</em> and _numChannels _are the number of columns in the matrix and number of channels in the matrix respectively.</p>
<h2>Working with structures</h2>
<p>Generally, you''d want to have a matrix of structures, say, <code>CvPoint2D32f</code>. How do the above rules play out then?</p>
<p>Its simple, the "channels" become the <code>CvPoint2D32f</code>''s data members. So you''d have 2 "channels"... at least in the memory sort of way.</p>
<p>Try coming up with a layout for a matrix of matrices. ;) </p>
<h2>Done!</h2>
<p>With that information, you should be able to use pointer arithmetic to move around a matrix with ease. And importantly, access the correct elements ;)</p>','/static/img/tut/post-opencv-matrix.jpg','2010-04-17',1,3,'memory-layout-of-matrices-of-multidimensional-objects');
INSERT INTO "aishack_tutorial" VALUES('SuDoKu Grabber with OpenCV: The Plot','',27,'<p>Here''s an interesting project that I''ll be taking your over the next few days. We''ll create an app that can recognize a SuDoKu puzzle from a picture taken by a camera (maybe on a phone). We''ll be going over a lot of stuff: geometric transformations, character recognition, logic, etc. This post is an overview of how things will work for the SuDoKu grabber! </p>
<h2>Recognizing SuDoKu puzzles</h2>
<p>For identifying SuDoKu puzzles, we''ll make use of the simpler tools image processing provides. Character recognition, detecting lines, fixing skewed pictures, etc.</p>
<p>Here''s a little walkthough of how we''ll be implementing things.</p>
<p>Suppose we start off with this particular image:</p>
<figure><img alt="A picture of a SuDoKu puzzle taken from a camera" src="/static/img/tut/sudoku-original.jpg" /><figcaption>
<p>The original puzzle, as seen by the camera</p>
</figcaption>
</figure>
<p>The very first thing we need to do is identify the puzzle. Here are some of the challenges when doing this: </p>
<ul>
<li>The inner grid lines are very fine and will probably be tough to recognize.</li>
<li>The lines are not perfect. We''ll have to take care of that.</li>
<li>The black grid lines have colors same as a lot of other elements in the picture.</li>
</ul>
<p>To overcome all these, we''ll make one assumption: the puzzle is the biggest element in the image. And it''s a safe assumption to make. You probably aren''t looking to grab a sudoku puzzle if you''re looking at an entire newspaper page.</p>
<p>Another assumption I''m using for this series is that there is a thick black border outside the puzzle. In the above picture, the 3x3 boxes too have thick grid lines. But those aren''t needed. Only the outermost edges of the sudoku puzzle should have thick dark borders.</p>
<h3>Step 1: Segmenting the SuDoKu puzzle</h3>
<p>The first thing we do is segment the puzzle image with <a href="/tutorials/thresholding/">thresholding</a>. After this operation, we get the dark regions of the puzzle:</p>
<figure><img alt="A segmented sudoku puzzle" src="/static/img/tut/sudoku-segmented.jpg" /><figcaption>
<p>Segmentation ahoy!</p>
</figcaption>
</figure>
<p>Of course, there is some preprocessing involved. Things like smoothing out noise, some <a href="/tutorials/mathematical-morphology/">morphological operations</a>, etc. We''ll see the details when we start implementing this. </p>
<h3>Step 2: Detecting the puzzle blob</h3>
<p>We can''t detect lines in the image just yet. There are just way too many outliers. There are the numbers, the writing on the top and right edge of the puzzle. There are lines outside the puzzle too.</p>
<p>So we''ll use the assumption that the puzzle is the biggest thing in the image. We check the size of all blobs on the image. Only the puzzle''s grid lines are big enough to cover the largest area on the image.</p>
<p>So, on selecting the blob that covers the biggest region, we get this:</p>
<figure><img alt="The largest blob in the sudoku puzzle" src="/static/img/tut/sudoku-puzzle-blob.jpg" /><figcaption>
<p>The largest blob</p>
</figcaption>
</figure>
<p>This looks great! Next we detect lines in this noise-free image! </p>
<h3>Step 3: Locating the puzzle</h3>
<p>We can use the <a href="/tutorials/the-hough-transform/">Hough transform</a> to get lines in this image. It returns lines in mathematical terms. So after this step, we''ll know exactly where a lines lies... and not just the pixels where it lies.</p>
<figure><img alt="Grid lines detected on the puzzles borders" src="/static/img/tut/sudoku-detect-lines.jpg" /><figcaption>
<p>Grid lines detected</p>
</figcaption>
</figure>
<p>We don''t need all these lines. So we just take the lines nearest to the edges. And because they are mathematical lines, we can solve for their intersection. That could give us the four corners of the puzzle. Then, we know exactly where the puzzle is.</p>
<p>For our example, it looks like this: </p>
<figure><img alt="Spotted! The SuDoKu puzzle" src="/static/img/tut/sudoku-puzzle-located.jpg" /><figcaption>
<p>Spotted the sudoku!</p>
</figcaption>
</figure>
<p>The corners are not accurate. But pretty close. They should be good enough.</p>
<h3>Step 4: Fixing the image and accessing each cell</h3>
<p>We have four corners. We can remap this into a new image - where each corner corresponds to a corner on the image:</p>
<figure><img alt="Individual cells in the puzzle" src="/static/img/tut/sudoku-cells.jpg" /><figcaption>
<p>Trying to isolate cells</p>
</figcaption>
</figure>
<p>After remapping, we can divide the puzzle into a 9x9 grid. Each cell in the grid will correspond (approximately) to a cell on the puzzle. The correspondence might not be perfect, but it should be good enough. </p>
<h3>Step 5: Identify the numbers</h3>
<p>Now for the final part: character recognition. This is simple: we just iterate through each cell and check if it contains some number. If it does, we store it in the internal data structure that holds the sudoku.</p>','/static/img/tut/post-sudoku.jpg','2010-08-25',1,3,'sudoku-grabber-with-opencv-plot');
INSERT INTO "aishack_tutorial" VALUES('SuDoKu Grabber with OpenCV: Grid detection','',28,'<p>In this post,we ''ll look at detecting a SuDoKu puzzle. This include all preprocessing done on the image: filtering the image to ensure we''re not affected too much by noise. Also, segmenting the image is dealt with here. I''ve used a weird segmentation approach, so you might want to have a look at that. By the end of this post, you''ll have several possible lines that describe the puzzle grid.</p>
<h2>Getting started</h2>
<p>Start by creating a new project in your IDE. If you''re not sure how that is done, have a look at the <a href="/tutorials/using-opencv-on-windows/">Getting started with OpenCV</a> guide.</p>
<p>Also, I''ll use <a href="/tutorials/opencvs-c-interface/">OpenCV''s C++ interface</a>. So make sure you have at least OpenCV 2.0 installed on your computer.</p>
<p>Link your project to the OpenCV library files and include the following in your main file: </p>
<div class="codehilite"><pre><span class="cp">#include &lt;cv.h&gt;</span>
<span class="cp">#include &lt;highgui.h&gt;</span>


<span class="kt">int</span> <span class="nf">main</span><span class="p">()</span>
<span class="p">{</span>
    <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>For now, we''ll use a static image for detecting a puzzle. So we load an image: </p>
<div class="codehilite"><pre><span class="kt">int</span> <span class="nf">main</span><span class="p">()</span>
<span class="p">{</span>
    <span class="n">Mat</span> <span class="n">sudoku</span> <span class="o">=</span> <span class="n">imread</span><span class="p">(</span><span class="s">&quot;sudoku.jpg&quot;</span><span class="p">,</span> <span class="mi">0</span><span class="p">);</span>
</pre></div>


<figure><img alt="" src="/static/img/tut/sudoku-original.jpg" />  <figcaption>
<p>An image with a sudoku puzzle  </p>
</figcaption>
</figure>
<p>Note that we load the image in grayscale mode. We don''t want to bother with the colour information, so just skip it. Next, we create a blank image of the same size. This image will hold the actual outer box of puzzle: </p>
<div class="codehilite"><pre>    <span class="n">Mat</span> <span class="n">outerBox</span> <span class="o">=</span> <span class="n">Mat</span><span class="p">(</span><span class="n">sudoku</span><span class="p">.</span><span class="n">size</span><span class="p">(),</span> <span class="n">CV_8UC1</span><span class="p">);</span>
</pre></div>


<h2>Preprocessing the image</h2>
<p>Blur the image a little. This smooths out the noise a bit and makes extracting the grid lines easier. </p>
<div class="codehilite"><pre>    <span class="n">GaussianBlur</span><span class="p">(</span><span class="n">sudoku</span><span class="p">,</span> <span class="n">sudoku</span><span class="p">,</span> <span class="n">Size</span><span class="p">(</span><span class="mi">11</span><span class="p">,</span><span class="mi">11</span><span class="p">),</span> <span class="mi">0</span><span class="p">);</span>
</pre></div>


<p>With the noise smoothed out, we can now <a href="/tutorials/thresholding/">threshold the image</a>. The image can have varying illumination levels, so a good choice for a thresholding algorithm would be an adaptive threshold. It calculates a threshold level several small windows in the image. This threshold level is calculated using the mean level in the window. So it keeps things illumination independent.</p>
<div class="codehilite"><pre>    <span class="n">adaptiveThreshold</span><span class="p">(</span><span class="n">sudoku</span><span class="p">,</span> <span class="n">outerBox</span><span class="p">,</span> <span class="mi">255</span><span class="p">,</span> <span class="n">ADAPTIVE_THRESH_MEAN_C</span><span class="p">,</span> <span class="n">THRESH_BINARY</span><span class="p">,</span> <span class="mi">5</span><span class="p">,</span> <span class="mi">2</span><span class="p">);</span>
</pre></div>


<p>It calculates a mean over a 5x5 window and subtracts 2 from the mean. This is the threshold level for every pixel.</p>
<p>Since we''re interested in the borders, and they are black, we invert the image <em>outerBox</em>. Then, the borders of the puzzles are white (along with other noise). </p>
<div class="codehilite"><pre>    <span class="n">bitwise_not</span><span class="p">(</span><span class="n">outerBox</span><span class="p">,</span> <span class="n">outerBox</span><span class="p">);</span>
</pre></div>


<p>This thresholding operation can disconnect certain <a href="/tutorials/pixel-neighbourhoods-and-connectedness/">connected parts</a> (like lines). So dilating the image once will fill up any small "cracks" that might have crept in. </p>
<div class="codehilite"><pre>    <span class="n">Mat</span> <span class="n">kernel</span> <span class="o">=</span> <span class="p">(</span><span class="n">Mat_</span><span class="o">&lt;</span><span class="n">uchar</span><span class="o">&gt;</span><span class="p">(</span><span class="mi">3</span><span class="p">,</span><span class="mi">3</span><span class="p">)</span> <span class="o">&lt;&lt;</span> <span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">,</span><span class="mi">1</span><span class="p">,</span><span class="mi">1</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">,</span><span class="mi">0</span><span class="p">);</span>
    <span class="n">dilate</span><span class="p">(</span><span class="n">outerBox</span><span class="p">,</span> <span class="n">outerBox</span><span class="p">,</span> <span class="n">kernel</span><span class="p">);</span>
</pre></div>


<p>Note that I''ve used a plus shaped structuring element here (the <em>kernel</em> matrix).</p>
<figure><img alt="After inverting and dilating the puzzle" src="/static/img/tut/sudoku-inverted-dilated.jpg" />  <figcaption>
<p>After inverting and dilating the puzzle  </p>
</figcaption>
</figure>
<h2>Finding the biggest blob</h2>
<p>For this project, I didn''t want to use any library for blobs. So I made a little hack for detecting blobs. If you want, you can use cvBlobsLib.</p>
<p>Here''s the technique I use. First, I use the floodfill command. This command returns a bounding rectangle of the pixels it filled. We''ve assumed the biggest thing in the picture to be the puzzle. So the biggest blob should have be the puzzle. Since it is the biggest, it will have the biggest bounding box as well. So we find the biggest bounding box, and save the location where we did the flood fill. </p>
<div class="codehilite"><pre>    <span class="kt">int</span> <span class="n">count</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span>
    <span class="kt">int</span> <span class="n">max</span><span class="o">=-</span><span class="mi">1</span><span class="p">;</span>

    <span class="n">Point</span> <span class="n">maxPt</span><span class="p">;</span>

    <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">y</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">y</span><span class="o">&lt;</span><span class="n">outerBox</span><span class="p">.</span><span class="n">size</span><span class="p">().</span><span class="n">height</span><span class="p">;</span><span class="n">y</span><span class="o">++</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="n">uchar</span> <span class="o">*</span><span class="n">row</span> <span class="o">=</span> <span class="n">outerBox</span><span class="p">.</span><span class="n">ptr</span><span class="p">(</span><span class="n">y</span><span class="p">);</span>
        <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">x</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">x</span><span class="o">&lt;</span><span class="n">outerBox</span><span class="p">.</span><span class="n">size</span><span class="p">().</span><span class="n">width</span><span class="p">;</span><span class="n">x</span><span class="o">++</span><span class="p">)</span>
        <span class="p">{</span>
            <span class="k">if</span><span class="p">(</span><span class="n">row</span><span class="p">[</span><span class="n">x</span><span class="p">]</span><span class="o">&gt;=</span><span class="mi">128</span><span class="p">)</span>
            <span class="p">{</span>

                 <span class="kt">int</span> <span class="n">area</span> <span class="o">=</span> <span class="n">floodFill</span><span class="p">(</span><span class="n">outerBox</span><span class="p">,</span> <span class="n">Point</span><span class="p">(</span><span class="n">x</span><span class="p">,</span><span class="n">y</span><span class="p">),</span> <span class="n">CV_RGB</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">64</span><span class="p">));</span>

                 <span class="k">if</span><span class="p">(</span><span class="n">area</span><span class="o">&gt;</span><span class="n">max</span><span class="p">)</span>
                 <span class="p">{</span>
                     <span class="n">maxPt</span> <span class="o">=</span> <span class="n">Point</span><span class="p">(</span><span class="n">x</span><span class="p">,</span><span class="n">y</span><span class="p">);</span>
                     <span class="n">max</span> <span class="o">=</span> <span class="n">area</span><span class="p">;</span>
                 <span class="p">}</span>
            <span class="p">}</span>
        <span class="p">}</span>

    <span class="p">}</span>
</pre></div>


<figure><img alt="Flood filling each blob (in progress)" src="/static/img/tut/sudoku-blobfilling-in-progress1.jpg" />  <figcaption>
<p>Flood filling each blob (in progress)  </p>
</figcaption>
</figure>
<p>We iterate through the image. The &gt;=128 condition is to ensure that only the white parts are flooded. Whenever we encounter such a part, we flood it with a dark gray colour (gray level 64). So in the future, we won''t be reflooding these blobs. And whenever we encounter a big blob, we note the current point and the area it has.</p>
<p>Now, we have several blobs filled with a dark gray colour (level 64). And we also know the point what produces a blob with maximum area. So we floodfill that point with white: </p>
<div class="codehilite"><pre>    <span class="n">floodFill</span><span class="p">(</span><span class="n">outerBox</span><span class="p">,</span> <span class="n">maxPt</span><span class="p">,</span> <span class="n">CV_RGB</span><span class="p">(</span><span class="mi">255</span><span class="p">,</span><span class="mi">255</span><span class="p">,</span><span class="mi">255</span><span class="p">));</span>
</pre></div>


<p>Now, the biggest blob is white. We need to turn the other blobs black. We do that here: </p>
<div class="codehilite"><pre>    <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">y</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">y</span><span class="o">&lt;</span><span class="n">outerBox</span><span class="p">.</span><span class="n">size</span><span class="p">().</span><span class="n">height</span><span class="p">;</span><span class="n">y</span><span class="o">++</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="n">uchar</span> <span class="o">*</span><span class="n">row</span> <span class="o">=</span> <span class="n">outerBox</span><span class="p">.</span><span class="n">ptr</span><span class="p">(</span><span class="n">y</span><span class="p">);</span>
        <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">x</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">x</span><span class="o">&lt;</span><span class="n">outerBox</span><span class="p">.</span><span class="n">size</span><span class="p">().</span><span class="n">width</span><span class="p">;</span><span class="n">x</span><span class="o">++</span><span class="p">)</span>
        <span class="p">{</span>
            <span class="k">if</span><span class="p">(</span><span class="n">row</span><span class="p">[</span><span class="n">x</span><span class="p">]</span><span class="o">==</span><span class="mi">64</span> <span class="o">&amp;&amp;</span> <span class="n">x</span><span class="o">!=</span><span class="n">maxPt</span><span class="p">.</span><span class="n">x</span> <span class="o">&amp;&amp;</span> <span class="n">y</span><span class="o">!=</span><span class="n">maxPt</span><span class="p">.</span><span class="n">y</span><span class="p">)</span>
            <span class="p">{</span>
                <span class="kt">int</span> <span class="n">area</span> <span class="o">=</span> <span class="n">floodFill</span><span class="p">(</span><span class="n">outerBox</span><span class="p">,</span> <span class="n">Point</span><span class="p">(</span><span class="n">x</span><span class="p">,</span><span class="n">y</span><span class="p">),</span> <span class="n">CV_RGB</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">));</span>
            <span class="p">}</span>
        <span class="p">}</span>
    <span class="p">}</span>
</pre></div>


<p>Wherever a dark gray point is enountered, it is flooded with black, effectively "hiding" it.</p>
<p>Because we had dilated the image earlier, we''ll "restore" it a bit by eroding it: </p>
<div class="codehilite"><pre>    <span class="n">erode</span><span class="p">(</span><span class="n">outerBox</span><span class="p">,</span> <span class="n">outerBox</span><span class="p">,</span> <span class="n">kernel</span><span class="p">);</span>
    <span class="n">imshow</span><span class="p">(</span><span class="s">&quot;thresholded&quot;</span><span class="p">,</span> <span class="n">outerBox</span><span class="p">);</span>
</pre></div>


<figure><img alt="The biggest blob, after morphological erosion" src="/static/img/tut/sudoku-final-blob.jpg" />  <figcaption>
<p>The biggest blob, after morphological erosion  </p>
</figcaption>
</figure>
<h2>Detecting lines</h2>
<p>At this point, we have a single blob. Now its time to find lines. This is done with the <a href="/tutorials/the-hough-transform/">Hough transform</a>. OpenCV comes with it. So a line of code is all that''s needed: </p>
<div class="codehilite"><pre>    <span class="n">vector</span><span class="o">&lt;</span><span class="n">Vec2f</span><span class="o">&gt;</span> <span class="n">lines</span><span class="p">;</span>
    <span class="n">HoughLines</span><span class="p">(</span><span class="n">outerBox</span><span class="p">,</span> <span class="n">lines</span><span class="p">,</span> <span class="mi">1</span><span class="p">,</span> <span class="n">CV_PI</span><span class="o">/</span><span class="mi">180</span><span class="p">,</span> <span class="mi">200</span><span class="p">);</span>
</pre></div>


<p>For now, we''ll draw each line. Just to see if the results too now are good enough or not: </p>
<div class="codehilite"><pre>    <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">i</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">i</span><span class="o">&lt;</span><span class="n">lines</span><span class="p">.</span><span class="n">size</span><span class="p">();</span><span class="n">i</span><span class="o">++</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="n">drawLine</span><span class="p">(</span><span class="n">lines</span><span class="p">[</span><span class="n">i</span><span class="p">],</span> <span class="n">outerBox</span><span class="p">,</span> <span class="n">CV_RGB</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">128</span><span class="p">));</span>
    <span class="p">}</span>
</pre></div>


<p>Where, the drawLine function is: </p>
<div class="codehilite"><pre><span class="kt">void</span> <span class="nf">drawLine</span><span class="p">(</span><span class="n">Vec2f</span> <span class="n">line</span><span class="p">,</span> <span class="n">Mat</span> <span class="o">&amp;</span><span class="n">img</span><span class="p">,</span> <span class="n">Scalar</span> <span class="n">rgb</span> <span class="o">=</span> <span class="n">CV_RGB</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">255</span><span class="p">))</span>
<span class="p">{</span>
    <span class="k">if</span><span class="p">(</span><span class="n">line</span><span class="p">[</span><span class="mi">1</span><span class="p">]</span><span class="o">!=</span><span class="mi">0</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="kt">float</span> <span class="n">m</span> <span class="o">=</span> <span class="o">-</span><span class="mi">1</span><span class="o">/</span><span class="n">tan</span><span class="p">(</span><span class="n">line</span><span class="p">[</span><span class="mi">1</span><span class="p">]);</span>

        <span class="kt">float</span> <span class="n">c</span> <span class="o">=</span> <span class="n">line</span><span class="p">[</span><span class="mi">0</span><span class="p">]</span><span class="o">/</span><span class="n">sin</span><span class="p">(</span><span class="n">line</span><span class="p">[</span><span class="mi">1</span><span class="p">]);</span>

        <span class="n">cv</span><span class="o">::</span><span class="n">line</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="n">Point</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span> <span class="n">c</span><span class="p">),</span> <span class="n">Point</span><span class="p">(</span><span class="n">img</span><span class="p">.</span><span class="n">size</span><span class="p">().</span><span class="n">width</span><span class="p">,</span> <span class="n">m</span><span class="o">*</span><span class="n">img</span><span class="p">.</span><span class="n">size</span><span class="p">().</span><span class="n">width</span><span class="o">+</span><span class="n">c</span><span class="p">),</span> <span class="n">rgb</span><span class="p">);</span>
    <span class="p">}</span>
    <span class="k">else</span>
    <span class="p">{</span>
        <span class="n">cv</span><span class="o">::</span><span class="n">line</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="n">Point</span><span class="p">(</span><span class="n">line</span><span class="p">[</span><span class="mi">0</span><span class="p">],</span> <span class="mi">0</span><span class="p">),</span> <span class="n">Point</span><span class="p">(</span><span class="n">line</span><span class="p">[</span><span class="mi">0</span><span class="p">],</span> <span class="n">img</span><span class="p">.</span><span class="n">size</span><span class="p">().</span><span class="n">height</span><span class="p">),</span> <span class="n">rgb</span><span class="p">);</span>
    <span class="p">}</span>

<span class="p">}</span>
</pre></div>


<p>This function takes a line in the normal form (a distance from the original and angle with the x-axis). Then, if the line is vertical (infinite slope), it draws the line appropariately. If not, it finds two points on the line and draws a line accordingly.</p>
<figure><img alt="Lines detected by the hough transform" src="/static/img/tut/sudoku-possible-lines.jpg" />  <figcaption>
<p>Lines detected by the Hough transform  </p>
</figcaption>
</figure>
<p>As you can see, each physical line has several possible approximations. This is usually because the physical line is thick. So, just these lines aren''t enough for figuring out where the puzzle is located. We''ll have to do some math with these lines. But we''ll do that in the next post. I think this one has been long enough. </p>
<h2>Summary</h2>
<p>Today, we implemented the first half of the SuDoKu grabber. We''ve been able to detect the physical borders of the puzzle till now, but the results aren''t usable directly. We''ll do a little math with them and fix that next.</p>','/static/img/tut/post-sudoku.jpg','2010-08-25',1,3,'sudoku-grabber-with-opencv-detection');
INSERT INTO "aishack_tutorial" VALUES('SuDoKu Grabber with OpenCV: Extracting the grid','',29,'<p>In <a href="/tutorials/detecting-a-sudoku-puzzle-in-an-image-part-1/">the last post</a>, we had found some lines. But the numerous lines were not good enough for detecting the location of the puzzle. So we''ll do some math today and find out exactly where the puzzle is. We''ll also un-distort the puzzle so we have a perfect top-down view of the sudoku puzzle. </p>
<h2>Merging lines</h2>
<p>Each physical line on the image has several "mathematical" lines associated with it. This is because of its One way to fix this is to "merge" lines that are close by.</p>
<figure><img alt="Lines detected by the hough transform" src="/static/img/tut/sudoku-possible-lines.jpg" />  <figcaption>
<p>Lines detected by the Hough transform  </p>
</figcaption>
</figure>
<p>By merging lines I mean averaging nearby lines. So lines that are within a certain distance will "fuse" together.</p>
<p>We''ll write another function to fuse lines together.  Start off by: </p>
<div class="codehilite"><pre><span class="kt">void</span> <span class="nf">mergeRelatedLines</span><span class="p">(</span><span class="n">vector</span><span class="o">&lt;</span><span class="n">Vec2f</span><span class="o">&gt;</span> <span class="o">*</span><span class="n">lines</span><span class="p">,</span> <span class="n">Mat</span> <span class="o">&amp;</span><span class="n">img</span><span class="p">)</span>
<span class="p">{</span>
    <span class="n">vector</span><span class="o">&lt;</span><span class="n">Vec2f</span><span class="o">&gt;::</span><span class="n">iterator</span> <span class="n">current</span><span class="p">;</span>
    <span class="k">for</span><span class="p">(</span><span class="n">current</span><span class="o">=</span><span class="n">lines</span><span class="o">-&gt;</span><span class="n">begin</span><span class="p">();</span><span class="n">current</span><span class="o">!=</span><span class="n">lines</span><span class="o">-&gt;</span><span class="n">end</span><span class="p">();</span><span class="n">current</span><span class="o">++</span><span class="p">)</span>
    <span class="p">{</span>
</pre></div>


<p>The iterator helps traverse the array list. Each element of the list contains 2 things: rho and theta (the <a href="/tutorials/converting-lines-from-normal-to-slope-intercept-form/">normal form</a> of a line).</p>
<p>During the merging process, certain lines will fuse together. So, we''ll need to mark lines that have been fused (so they aren''t considered for other things). This is done by setting the rho to zero and theta to -100 (an impossible value). So whenever we encounter such a line, we simply skip it: </p>
<div class="codehilite"><pre><span class="k">if</span><span class="p">((</span><span class="o">*</span><span class="n">current</span><span class="p">)[</span><span class="mi">0</span><span class="p">]</span><span class="o">==</span><span class="mi">0</span> <span class="o">&amp;&amp;</span> <span class="p">(</span><span class="o">*</span><span class="n">current</span><span class="p">)[</span><span class="mi">1</span><span class="p">]</span><span class="o">==-</span><span class="mi">100</span><span class="p">)</span> <span class="k">continue</span><span class="p">;</span>
</pre></div>


<p>Now, we store the rho and theta for the current line in two variables: </p>
<div class="codehilite"><pre>        <span class="kt">float</span> <span class="n">p1</span> <span class="o">=</span> <span class="p">(</span><span class="o">*</span><span class="n">current</span><span class="p">)[</span><span class="mi">0</span><span class="p">];</span>
        <span class="kt">float</span> <span class="n">theta1</span> <span class="o">=</span> <span class="p">(</span><span class="o">*</span><span class="n">current</span><span class="p">)[</span><span class="mi">1</span><span class="p">];</span>
</pre></div>


<p>With these two values, we find two points on the line:; </p>
<div class="codehilite"><pre>        <span class="n">Point</span> <span class="n">pt1current</span><span class="p">,</span> <span class="n">pt2current</span><span class="p">;</span>
        <span class="k">if</span><span class="p">(</span><span class="n">theta1</span><span class="o">&gt;</span><span class="n">CV_PI</span><span class="o">*</span><span class="mi">45</span><span class="o">/</span><span class="mi">180</span> <span class="o">&amp;&amp;</span> <span class="n">theta1</span><span class="o">&lt;</span><span class="n">CV_PI</span><span class="o">*</span><span class="mi">135</span><span class="o">/</span><span class="mi">180</span><span class="p">)</span>
        <span class="p">{</span>
            <span class="n">pt1current</span><span class="p">.</span><span class="n">x</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span>

            <span class="n">pt1current</span><span class="p">.</span><span class="n">y</span> <span class="o">=</span> <span class="n">p1</span><span class="o">/</span><span class="n">sin</span><span class="p">(</span><span class="n">theta1</span><span class="p">);</span>

            <span class="n">pt2current</span><span class="p">.</span><span class="n">x</span><span class="o">=</span><span class="n">img</span><span class="p">.</span><span class="n">size</span><span class="p">().</span><span class="n">width</span><span class="p">;</span>
            <span class="n">pt2current</span><span class="p">.</span><span class="n">y</span><span class="o">=-</span><span class="n">pt2current</span><span class="p">.</span><span class="n">x</span><span class="o">/</span><span class="n">tan</span><span class="p">(</span><span class="n">theta1</span><span class="p">)</span> <span class="o">+</span> <span class="n">p1</span><span class="o">/</span><span class="n">sin</span><span class="p">(</span><span class="n">theta1</span><span class="p">);</span>
        <span class="p">}</span>
        <span class="k">else</span>
        <span class="p">{</span>
            <span class="n">pt1current</span><span class="p">.</span><span class="n">y</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span>

            <span class="n">pt1current</span><span class="p">.</span><span class="n">x</span><span class="o">=</span><span class="n">p1</span><span class="o">/</span><span class="n">cos</span><span class="p">(</span><span class="n">theta1</span><span class="p">);</span>

            <span class="n">pt2current</span><span class="p">.</span><span class="n">y</span><span class="o">=</span><span class="n">img</span><span class="p">.</span><span class="n">size</span><span class="p">().</span><span class="n">height</span><span class="p">;</span>
            <span class="n">pt2current</span><span class="p">.</span><span class="n">x</span><span class="o">=-</span><span class="n">pt2current</span><span class="p">.</span><span class="n">y</span><span class="o">/</span><span class="n">tan</span><span class="p">(</span><span class="n">theta1</span><span class="p">)</span> <span class="o">+</span> <span class="n">p1</span><span class="o">/</span><span class="n">cos</span><span class="p">(</span><span class="n">theta1</span><span class="p">);</span>

        <span class="p">}</span>
</pre></div>


<p>If the is horizontal (theta is around 90 degrees), we find a point at the extreme left (x=0) and one at the extreme right (x=img.width). If not, we find a point at the extreme top (y=0) and one at extreme bottom (y=img.height).</p>
<p>All the calculations are done based on the <a href="/tutorials/converting-lines-from-normal-to-slope-intercept-form/">normal form</a> of a line.</p>
<p>Next, we start iterating over the lines again: </p>
<div class="codehilite"><pre>        <span class="n">vector</span><span class="o">&lt;</span><span class="n">Vec2f</span><span class="o">&gt;::</span><span class="n">iterator</span><span class="err">  </span> <span class="err"> </span><span class="n">pos</span><span class="p">;</span>
        <span class="k">for</span><span class="p">(</span><span class="n">pos</span><span class="o">=</span><span class="n">lines</span><span class="o">-&gt;</span><span class="n">begin</span><span class="p">();</span><span class="n">pos</span><span class="o">!=</span><span class="n">lines</span><span class="o">-&gt;</span><span class="n">end</span><span class="p">();</span><span class="n">pos</span><span class="o">++</span><span class="p">)</span>
        <span class="p">{</span>
            <span class="k">if</span><span class="p">(</span><span class="o">*</span><span class="n">current</span><span class="o">==*</span><span class="n">pos</span><span class="p">)</span> <span class="k">continue</span><span class="p">;</span>
</pre></div>


<p>With this loop, we can compare every line with every other line. If we find that the line <em>current</em> is the same as the line <em>pos</em>, we continue. No point fusing the same line.</p>
<p>Now we check if the lines are within a certain distance of each other: </p>
<div class="codehilite"><pre>            <span class="k">if</span><span class="p">(</span><span class="n">fabs</span><span class="p">((</span><span class="o">*</span><span class="n">pos</span><span class="p">)[</span><span class="mi">0</span><span class="p">]</span><span class="o">-</span><span class="p">(</span><span class="o">*</span><span class="n">current</span><span class="p">)[</span><span class="mi">0</span><span class="p">])</span><span class="o">&lt;</span><span class="mi">20</span> <span class="o">&amp;&amp;</span> <span class="n">fabs</span><span class="p">((</span><span class="o">*</span><span class="n">pos</span><span class="p">)[</span><span class="mi">1</span><span class="p">]</span><span class="o">-</span><span class="p">(</span><span class="o">*</span><span class="n">current</span><span class="p">)[</span><span class="mi">1</span><span class="p">])</span><span class="o">&lt;</span><span class="n">CV_PI</span><span class="o">*</span><span class="mi">10</span><span class="o">/</span><span class="mi">180</span><span class="p">)</span>
            <span class="p">{</span>
                <span class="kt">float</span> <span class="n">p</span> <span class="o">=</span> <span class="p">(</span><span class="o">*</span><span class="n">pos</span><span class="p">)[</span><span class="mi">0</span><span class="p">];</span>
                <span class="kt">float</span> <span class="n">theta</span> <span class="o">=</span> <span class="p">(</span><span class="o">*</span><span class="n">pos</span><span class="p">)[</span><span class="mi">1</span><span class="p">];</span>
</pre></div>


<p>If they are, we store the rho and theta for the line <em>pos</em>.</p>
<p>And again, we find two points on the line <em>pos</em>: </p>
<div class="codehilite"><pre>                <span class="n">Point</span> <span class="n">pt1</span><span class="p">,</span> <span class="n">pt2</span><span class="p">;</span>
                <span class="k">if</span><span class="p">((</span><span class="o">*</span><span class="n">pos</span><span class="p">)[</span><span class="mi">1</span><span class="p">]</span><span class="o">&gt;</span><span class="n">CV_PI</span><span class="o">*</span><span class="mi">45</span><span class="o">/</span><span class="mi">180</span> <span class="o">&amp;&amp;</span> <span class="p">(</span><span class="o">*</span><span class="n">pos</span><span class="p">)[</span><span class="mi">1</span><span class="p">]</span><span class="o">&lt;</span><span class="n">CV_PI</span><span class="o">*</span><span class="mi">135</span><span class="o">/</span><span class="mi">180</span><span class="p">)</span>
                <span class="p">{</span>
                    <span class="n">pt1</span><span class="p">.</span><span class="n">x</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span>
                    <span class="n">pt1</span><span class="p">.</span><span class="n">y</span> <span class="o">=</span> <span class="n">p</span><span class="o">/</span><span class="n">sin</span><span class="p">(</span><span class="n">theta</span><span class="p">);</span>
                    <span class="n">pt2</span><span class="p">.</span><span class="n">x</span><span class="o">=</span><span class="n">img</span><span class="p">.</span><span class="n">size</span><span class="p">().</span><span class="n">width</span><span class="p">;</span>
                    <span class="n">pt2</span><span class="p">.</span><span class="n">y</span><span class="o">=-</span><span class="n">pt2</span><span class="p">.</span><span class="n">x</span><span class="o">/</span><span class="n">tan</span><span class="p">(</span><span class="n">theta</span><span class="p">)</span> <span class="o">+</span> <span class="n">p</span><span class="o">/</span><span class="n">sin</span><span class="p">(</span><span class="n">theta</span><span class="p">);</span>
                <span class="p">}</span>
                <span class="k">else</span>
                <span class="p">{</span>
                    <span class="n">pt1</span><span class="p">.</span><span class="n">y</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span>
                    <span class="n">pt1</span><span class="p">.</span><span class="n">x</span><span class="o">=</span><span class="n">p</span><span class="o">/</span><span class="n">cos</span><span class="p">(</span><span class="n">theta</span><span class="p">);</span>
                    <span class="n">pt2</span><span class="p">.</span><span class="n">y</span><span class="o">=</span><span class="n">img</span><span class="p">.</span><span class="n">size</span><span class="p">().</span><span class="n">height</span><span class="p">;</span>
                    <span class="n">pt2</span><span class="p">.</span><span class="n">x</span><span class="o">=-</span><span class="n">pt2</span><span class="p">.</span><span class="n">y</span><span class="o">/</span><span class="n">tan</span><span class="p">(</span><span class="n">theta</span><span class="p">)</span> <span class="o">+</span> <span class="n">p</span><span class="o">/</span><span class="n">cos</span><span class="p">(</span><span class="n">theta</span><span class="p">);</span>
                <span class="p">}</span>
</pre></div>


<p>Now if endpoints of the line <em>pos</em> and the line <em>current</em> are close to each other, we fuse them: </p>
<div class="codehilite"><pre>                <span class="k">if</span><span class="p">(((</span><span class="kt">double</span><span class="p">)(</span><span class="n">pt1</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="n">pt1current</span><span class="p">.</span><span class="n">x</span><span class="p">)</span><span class="o">*</span><span class="p">(</span><span class="n">pt1</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="n">pt1current</span><span class="p">.</span><span class="n">x</span><span class="p">)</span> <span class="o">+</span> <span class="p">(</span><span class="n">pt1</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="n">pt1current</span><span class="p">.</span><span class="n">y</span><span class="p">)</span><span class="o">*</span><span class="p">(</span><span class="n">pt1</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="n">pt1current</span><span class="p">.</span><span class="n">y</span><span class="p">)</span><span class="o">&lt;</span><span class="mi">64</span><span class="o">*</span><span class="mi">64</span><span class="p">)</span> <span class="o">&amp;&amp;</span>
<span class="p">((</span><span class="kt">double</span><span class="p">)(</span><span class="n">pt2</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="n">pt2current</span><span class="p">.</span><span class="n">x</span><span class="p">)</span><span class="o">*</span><span class="p">(</span><span class="n">pt2</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="n">pt2current</span><span class="p">.</span><span class="n">x</span><span class="p">)</span> <span class="o">+</span> <span class="p">(</span><span class="n">pt2</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="n">pt2current</span><span class="p">.</span><span class="n">y</span><span class="p">)</span><span class="o">*</span><span class="p">(</span><span class="n">pt2</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="n">pt2current</span><span class="p">.</span><span class="n">y</span><span class="p">)</span><span class="o">&lt;</span><span class="mi">64</span><span class="o">*</span><span class="mi">64</span><span class="p">))</span>
                <span class="p">{</span>
                    <span class="c1">// Merge the two</span>
                    <span class="p">(</span><span class="o">*</span><span class="n">current</span><span class="p">)[</span><span class="mi">0</span><span class="p">]</span> <span class="o">=</span> <span class="p">((</span><span class="o">*</span><span class="n">current</span><span class="p">)[</span><span class="mi">0</span><span class="p">]</span><span class="o">+</span><span class="p">(</span><span class="o">*</span><span class="n">pos</span><span class="p">)[</span><span class="mi">0</span><span class="p">])</span><span class="o">/</span><span class="mi">2</span><span class="p">;</span>

                    <span class="p">(</span><span class="o">*</span><span class="n">current</span><span class="p">)[</span><span class="mi">1</span><span class="p">]</span> <span class="o">=</span> <span class="p">((</span><span class="o">*</span><span class="n">current</span><span class="p">)[</span><span class="mi">1</span><span class="p">]</span><span class="o">+</span><span class="p">(</span><span class="o">*</span><span class="n">pos</span><span class="p">)[</span><span class="mi">1</span><span class="p">])</span><span class="o">/</span><span class="mi">2</span><span class="p">;</span>

                    <span class="p">(</span><span class="o">*</span><span class="n">pos</span><span class="p">)[</span><span class="mi">0</span><span class="p">]</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span>
                    <span class="p">(</span><span class="o">*</span><span class="n">pos</span><span class="p">)[</span><span class="mi">1</span><span class="p">]</span><span class="o">=-</span><span class="mi">100</span><span class="p">;</span>
                <span class="p">}</span>
</pre></div>


<p>That''s all there is to fusing lines: </p>
<div class="codehilite"><pre>            <span class="p">}</span>
        <span class="p">}</span>
    <span class="p">}</span>
<span class="p">}</span>
</pre></div>


<p>Now you can add a call to this function after the Hough transform: </p>
<div class="codehilite"><pre>    <span class="n">vector</span><span class="o">&lt;</span><span class="n">Vec2f</span><span class="o">&gt;</span> <span class="n">lines</span><span class="p">;</span>

    <span class="n">HoughLines</span><span class="p">(</span><span class="n">outerBox</span><span class="p">,</span> <span class="n">lines</span><span class="p">,</span> <span class="mi">1</span><span class="p">,</span> <span class="n">CV_PI</span><span class="o">/</span><span class="mi">180</span><span class="p">,</span> <span class="mi">200</span><span class="p">);</span>

    <span class="n">mergeRelatedLines</span><span class="p">(</span><span class="o">&amp;</span><span class="n">lines</span><span class="p">,</span> <span class="n">sudoku</span><span class="p">);</span> <span class="c1">// Add this line</span>
</pre></div>


<p>And thus, we''ll have merged neighbouring lines.</p>
<figure><img alt="Merged lines!" src="/static/img/tut/sudoku-merged-lines.jpg" />  <figcaption>
<p>Merged lines!  </p>
</figcaption>
</figure>
<h2>Finding extreme lines</h2>
<p>Now we''ll try and detect lines that are nearest to the top edge, bottom edge, right edge and the left edge. These will be the outer boundaries of the sudoku puzzle. We start by adding these lines after the mergeRelatedLines call: </p>
<div class="codehilite"><pre><span class="err">   </span> <span class="c1">// Now detect the lines on extremes</span>
<span class="err">   </span> <span class="n">Vec2f</span> <span class="n">topEdge</span> <span class="o">=</span> <span class="n">Vec2f</span><span class="p">(</span><span class="mi">1000</span><span class="p">,</span><span class="mi">1000</span><span class="p">);</span><span class="err">  </span> <span class="err"> </span><span class="kt">double</span> <span class="n">topYIntercept</span><span class="o">=</span><span class="mi">100000</span><span class="p">,</span> <span class="n">topXIntercept</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span>
<span class="err">   </span> <span class="n">Vec2f</span> <span class="n">bottomEdge</span> <span class="o">=</span> <span class="n">Vec2f</span><span class="p">(</span><span class="o">-</span><span class="mi">1000</span><span class="p">,</span><span class="o">-</span><span class="mi">1000</span><span class="p">);</span><span class="err">  </span> <span class="err">   </span> <span class="err"> </span><span class="kt">double</span> <span class="n">bottomYIntercept</span><span class="o">=</span><span class="mi">0</span><span class="p">,</span> <span class="n">bottomXIntercept</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span>
<span class="err">   </span> <span class="n">Vec2f</span> <span class="n">leftEdge</span> <span class="o">=</span> <span class="n">Vec2f</span><span class="p">(</span><span class="mi">1000</span><span class="p">,</span><span class="mi">1000</span><span class="p">);</span><span class="err">  </span> <span class="err"> </span><span class="kt">double</span> <span class="n">leftXIntercept</span><span class="o">=</span><span class="mi">100000</span><span class="p">,</span> <span class="n">leftYIntercept</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span>
<span class="err">   </span> <span class="n">Vec2f</span> <span class="n">rightEdge</span> <span class="o">=</span> <span class="n">Vec2f</span><span class="p">(</span><span class="o">-</span><span class="mi">1000</span><span class="p">,</span><span class="o">-</span><span class="mi">1000</span><span class="p">);</span><span class="err">  </span> <span class="err">   </span> <span class="err"> </span><span class="kt">double</span> <span class="n">rightXIntercept</span><span class="o">=</span><span class="mi">0</span><span class="p">,</span> <span class="n">rightYIntercept</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span>
</pre></div>


<p>The initial values of each edge is initially set to a ridiculous value. This will ensure it gets to the proper edge later on. Now we loop over all lines: </p>
<div class="codehilite"><pre><span class="err">   </span> <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">i</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">i</span><span class="o">&lt;</span><span class="n">lines</span><span class="p">.</span><span class="n">size</span><span class="p">();</span><span class="n">i</span><span class="o">++</span><span class="p">)</span>
<span class="err">   </span> <span class="p">{</span>

<span class="err">       </span> <span class="n">Vec2f</span> <span class="n">current</span> <span class="o">=</span> <span class="n">lines</span><span class="p">[</span><span class="n">i</span><span class="p">];</span>

<span class="err">       </span> <span class="kt">float</span> <span class="n">p</span><span class="o">=</span><span class="n">current</span><span class="p">[</span><span class="mi">0</span><span class="p">];</span>

<span class="err">       </span> <span class="kt">float</span> <span class="n">theta</span><span class="o">=</span><span class="n">current</span><span class="p">[</span><span class="mi">1</span><span class="p">];</span>

<span class="err">       </span> <span class="k">if</span><span class="p">(</span><span class="n">p</span><span class="o">==</span><span class="mi">0</span> <span class="o">&amp;&amp;</span> <span class="n">theta</span><span class="o">==-</span><span class="mi">100</span><span class="p">)</span>
<span class="err">           </span> <span class="k">continue</span><span class="p">;</span>
</pre></div>


<p>We store the rho and theta values. If we encounter a "merged" line, we simply skip it. Now we use the <a href="/tutorials/converting-lines-from-normal-to-slope-intercept-form/">normal form</a> of line to calculate the x and y intercepts (the place where the lines intersects the X and Y axis) </p>
<div class="codehilite"><pre><span class="err">       </span> <span class="kt">double</span> <span class="n">xIntercept</span><span class="p">,</span> <span class="n">yIntercept</span><span class="p">;</span>
<span class="err">       </span> <span class="n">xIntercept</span> <span class="o">=</span> <span class="n">p</span><span class="o">/</span><span class="n">cos</span><span class="p">(</span><span class="n">theta</span><span class="p">);</span>
<span class="err">       </span> <span class="n">yIntercept</span> <span class="o">=</span> <span class="n">p</span><span class="o">/</span><span class="p">(</span><span class="n">cos</span><span class="p">(</span><span class="n">theta</span><span class="p">)</span><span class="o">*</span><span class="n">sin</span><span class="p">(</span><span class="n">theta</span><span class="p">));</span>
</pre></div>


<p>If the line is nearly vertical: </p>
<div class="codehilite"><pre><span class="err">       </span> <span class="k">if</span><span class="p">(</span><span class="n">theta</span><span class="o">&gt;</span><span class="n">CV_PI</span><span class="o">*</span><span class="mi">80</span><span class="o">/</span><span class="mi">180</span> <span class="o">&amp;&amp;</span> <span class="n">theta</span><span class="o">&lt;</span><span class="n">CV_PI</span><span class="o">*</span><span class="mi">100</span><span class="o">/</span><span class="mi">180</span><span class="p">)</span>
<span class="err">       </span> <span class="p">{</span>
<span class="err">           </span> <span class="k">if</span><span class="p">(</span><span class="n">p</span><span class="o">&lt;</span><span class="n">topEdge</span><span class="p">[</span><span class="mi">0</span><span class="p">])</span>

<span class="err">               </span> <span class="n">topEdge</span> <span class="o">=</span> <span class="n">current</span><span class="p">;</span>

<span class="err">           </span> <span class="k">if</span><span class="p">(</span><span class="n">p</span><span class="o">&gt;</span><span class="n">bottomEdge</span><span class="p">[</span><span class="mi">0</span><span class="p">])</span>
<span class="err">               </span> <span class="n">bottomEdge</span> <span class="o">=</span> <span class="n">current</span><span class="p">;</span>
<span class="err">       </span> <span class="p">}</span>
</pre></div>


<p>Otherwise, if they are nearly horizontal, </p>
<div class="codehilite"><pre><span class="err">       </span> <span class="k">else</span> <span class="k">if</span><span class="p">(</span><span class="n">theta</span><span class="o">&lt;</span><span class="n">CV_PI</span><span class="o">*</span><span class="mi">10</span><span class="o">/</span><span class="mi">180</span> <span class="o">||</span> <span class="n">theta</span><span class="o">&gt;</span><span class="n">CV_PI</span><span class="o">*</span><span class="mi">170</span><span class="o">/</span><span class="mi">180</span><span class="p">)</span>
<span class="err">       </span> <span class="p">{</span>
<span class="err">           </span> <span class="k">if</span><span class="p">(</span><span class="n">xIntercept</span><span class="o">&gt;</span><span class="n">rightXIntercept</span><span class="p">)</span>
<span class="err">           </span> <span class="p">{</span>
<span class="err">               </span> <span class="n">rightEdge</span> <span class="o">=</span> <span class="n">current</span><span class="p">;</span>
<span class="err">               </span> <span class="n">rightXIntercept</span> <span class="o">=</span> <span class="n">xIntercept</span><span class="p">;</span>
<span class="err">           </span> <span class="p">}</span>
<span class="err">           </span> <span class="k">else</span> <span class="k">if</span><span class="p">(</span><span class="n">xIntercept</span><span class="o">&lt;=</span><span class="n">leftXIntercept</span><span class="p">)</span>
<span class="err">           </span> <span class="p">{</span>
<span class="err">               </span> <span class="n">leftEdge</span> <span class="o">=</span> <span class="n">current</span><span class="p">;</span>
<span class="err">               </span> <span class="n">leftXIntercept</span> <span class="o">=</span> <span class="n">xIntercept</span><span class="p">;</span>
<span class="err">           </span> <span class="p">}</span>
<span class="err">       </span> <span class="p">}</span>
<span class="err">   </span> <span class="p">}</span>
</pre></div>


<p>We''ve ignored any lines that have slopes at other angles. And this also ends the loop. Now, at the end of this loop, we''ll have the extreme lines. Just for visualizing it, we''ll draw those lines on the original image: </p>
<div class="codehilite"><pre><span class="err">   </span> <span class="n">drawLine</span><span class="p">(</span><span class="n">topEdge</span><span class="p">,</span> <span class="n">sudoku</span><span class="p">,</span> <span class="n">CV_RGB</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">));</span>
<span class="err">   </span> <span class="n">drawLine</span><span class="p">(</span><span class="n">bottomEdge</span><span class="p">,</span> <span class="n">sudoku</span><span class="p">,</span> <span class="n">CV_RGB</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">));</span>
<span class="err">   </span> <span class="n">drawLine</span><span class="p">(</span><span class="n">leftEdge</span><span class="p">,</span> <span class="n">sudoku</span><span class="p">,</span> <span class="n">CV_RGB</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">));</span>
<span class="err">   </span> <span class="n">drawLine</span><span class="p">(</span><span class="n">rightEdge</span><span class="p">,</span> <span class="n">sudoku</span><span class="p">,</span> <span class="n">CV_RGB</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">));</span>
</pre></div>


<p>Next, we''ll <a href="/tutorials/solving-for-intersection-of-lines-efficiently/">calculate the intersections</a> of these four lines. First, we find two points on each line. Then using some math, we can calculate exactly where any two particular lines intersect:</p>
<div class="codehilite"><pre><span class="err">   </span> <span class="n">Point</span> <span class="n">left1</span><span class="p">,</span> <span class="n">left2</span><span class="p">,</span> <span class="n">right1</span><span class="p">,</span> <span class="n">right2</span><span class="p">,</span> <span class="n">bottom1</span><span class="p">,</span> <span class="n">bottom2</span><span class="p">,</span> <span class="n">top1</span><span class="p">,</span> <span class="n">top2</span><span class="p">;</span>

<span class="err">   </span> <span class="kt">int</span> <span class="n">height</span><span class="o">=</span><span class="n">outerBox</span><span class="p">.</span><span class="n">size</span><span class="p">().</span><span class="n">height</span><span class="p">;</span>

<span class="err">   </span> <span class="kt">int</span> <span class="n">width</span><span class="o">=</span><span class="n">outerBox</span><span class="p">.</span><span class="n">size</span><span class="p">().</span><span class="n">width</span><span class="p">;</span>

<span class="err">   </span> <span class="k">if</span><span class="p">(</span><span class="n">leftEdge</span><span class="p">[</span><span class="mi">1</span><span class="p">]</span><span class="o">!=</span><span class="mi">0</span><span class="p">)</span>
<span class="err">   </span> <span class="p">{</span>
<span class="err">       </span> <span class="n">left1</span><span class="p">.</span><span class="n">x</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="err">  </span> <span class="err">   </span> <span class="err"> </span><span class="n">left1</span><span class="p">.</span><span class="n">y</span><span class="o">=</span><span class="n">leftEdge</span><span class="p">[</span><span class="mi">0</span><span class="p">]</span><span class="o">/</span><span class="n">sin</span><span class="p">(</span><span class="n">leftEdge</span><span class="p">[</span><span class="mi">1</span><span class="p">]);</span>
<span class="err">       </span> <span class="n">left2</span><span class="p">.</span><span class="n">x</span><span class="o">=</span><span class="n">width</span><span class="p">;</span><span class="err">  </span> <span class="err"> </span><span class="n">left2</span><span class="p">.</span><span class="n">y</span><span class="o">=-</span><span class="n">left2</span><span class="p">.</span><span class="n">x</span><span class="o">/</span><span class="n">tan</span><span class="p">(</span><span class="n">leftEdge</span><span class="p">[</span><span class="mi">1</span><span class="p">])</span> <span class="o">+</span> <span class="n">left1</span><span class="p">.</span><span class="n">y</span><span class="p">;</span>
<span class="err">   </span> <span class="p">}</span>
<span class="err">   </span> <span class="k">else</span>
<span class="err">   </span> <span class="p">{</span>
<span class="err">       </span> <span class="n">left1</span><span class="p">.</span><span class="n">y</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="err">  </span> <span class="err">   </span> <span class="err"> </span><span class="n">left1</span><span class="p">.</span><span class="n">x</span><span class="o">=</span><span class="n">leftEdge</span><span class="p">[</span><span class="mi">0</span><span class="p">]</span><span class="o">/</span><span class="n">cos</span><span class="p">(</span><span class="n">leftEdge</span><span class="p">[</span><span class="mi">1</span><span class="p">]);</span>
<span class="err">       </span> <span class="n">left2</span><span class="p">.</span><span class="n">y</span><span class="o">=</span><span class="n">height</span><span class="p">;</span><span class="err">  </span> <span class="err"> </span><span class="n">left2</span><span class="p">.</span><span class="n">x</span><span class="o">=</span><span class="n">left1</span><span class="p">.</span><span class="n">x</span> <span class="o">-</span> <span class="n">height</span><span class="o">*</span><span class="n">tan</span><span class="p">(</span><span class="n">leftEdge</span><span class="p">[</span><span class="mi">1</span><span class="p">]);</span>

<span class="err">   </span> <span class="p">}</span>

<span class="err">   </span> <span class="k">if</span><span class="p">(</span><span class="n">rightEdge</span><span class="p">[</span><span class="mi">1</span><span class="p">]</span><span class="o">!=</span><span class="mi">0</span><span class="p">)</span>
<span class="err">   </span> <span class="p">{</span>
<span class="err">       </span> <span class="n">right1</span><span class="p">.</span><span class="n">x</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="err">  </span> <span class="err">   </span> <span class="err"> </span><span class="n">right1</span><span class="p">.</span><span class="n">y</span><span class="o">=</span><span class="n">rightEdge</span><span class="p">[</span><span class="mi">0</span><span class="p">]</span><span class="o">/</span><span class="n">sin</span><span class="p">(</span><span class="n">rightEdge</span><span class="p">[</span><span class="mi">1</span><span class="p">]);</span>
<span class="err">       </span> <span class="n">right2</span><span class="p">.</span><span class="n">x</span><span class="o">=</span><span class="n">width</span><span class="p">;</span><span class="err">  </span> <span class="err"> </span><span class="n">right2</span><span class="p">.</span><span class="n">y</span><span class="o">=-</span><span class="n">right2</span><span class="p">.</span><span class="n">x</span><span class="o">/</span><span class="n">tan</span><span class="p">(</span><span class="n">rightEdge</span><span class="p">[</span><span class="mi">1</span><span class="p">])</span> <span class="o">+</span> <span class="n">right1</span><span class="p">.</span><span class="n">y</span><span class="p">;</span>
<span class="err">   </span> <span class="p">}</span>
<span class="err">   </span> <span class="k">else</span>
<span class="err">   </span> <span class="p">{</span>
<span class="err">       </span> <span class="n">right1</span><span class="p">.</span><span class="n">y</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="err">  </span> <span class="err">   </span> <span class="err"> </span><span class="n">right1</span><span class="p">.</span><span class="n">x</span><span class="o">=</span><span class="n">rightEdge</span><span class="p">[</span><span class="mi">0</span><span class="p">]</span><span class="o">/</span><span class="n">cos</span><span class="p">(</span><span class="n">rightEdge</span><span class="p">[</span><span class="mi">1</span><span class="p">]);</span>
<span class="err">       </span> <span class="n">right2</span><span class="p">.</span><span class="n">y</span><span class="o">=</span><span class="n">height</span><span class="p">;</span><span class="err">  </span> <span class="err"> </span><span class="n">right2</span><span class="p">.</span><span class="n">x</span><span class="o">=</span><span class="n">right1</span><span class="p">.</span><span class="n">x</span> <span class="o">-</span> <span class="n">height</span><span class="o">*</span><span class="n">tan</span><span class="p">(</span><span class="n">rightEdge</span><span class="p">[</span><span class="mi">1</span><span class="p">]);</span>

<span class="err">   </span> <span class="p">}</span>

<span class="err">   </span> <span class="n">bottom1</span><span class="p">.</span><span class="n">x</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="err">  </span> <span class="err"> </span><span class="n">bottom1</span><span class="p">.</span><span class="n">y</span><span class="o">=</span><span class="n">bottomEdge</span><span class="p">[</span><span class="mi">0</span><span class="p">]</span><span class="o">/</span><span class="n">sin</span><span class="p">(</span><span class="n">bottomEdge</span><span class="p">[</span><span class="mi">1</span><span class="p">]);</span>

<span class="err">   </span> <span class="n">bottom2</span><span class="p">.</span><span class="n">x</span><span class="o">=</span><span class="n">width</span><span class="p">;</span><span class="n">bottom2</span><span class="p">.</span><span class="n">y</span><span class="o">=-</span><span class="n">bottom2</span><span class="p">.</span><span class="n">x</span><span class="o">/</span><span class="n">tan</span><span class="p">(</span><span class="n">bottomEdge</span><span class="p">[</span><span class="mi">1</span><span class="p">])</span> <span class="o">+</span> <span class="n">bottom1</span><span class="p">.</span><span class="n">y</span><span class="p">;</span>

<span class="err">   </span> <span class="n">top1</span><span class="p">.</span><span class="n">x</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="err">  </span> <span class="err">   </span> <span class="err"> </span><span class="n">top1</span><span class="p">.</span><span class="n">y</span><span class="o">=</span><span class="n">topEdge</span><span class="p">[</span><span class="mi">0</span><span class="p">]</span><span class="o">/</span><span class="n">sin</span><span class="p">(</span><span class="n">topEdge</span><span class="p">[</span><span class="mi">1</span><span class="p">]);</span>
<span class="err">   </span> <span class="n">top2</span><span class="p">.</span><span class="n">x</span><span class="o">=</span><span class="n">width</span><span class="p">;</span><span class="err">  </span> <span class="err"> </span><span class="n">top2</span><span class="p">.</span><span class="n">y</span><span class="o">=-</span><span class="n">top2</span><span class="p">.</span><span class="n">x</span><span class="o">/</span><span class="n">tan</span><span class="p">(</span><span class="n">topEdge</span><span class="p">[</span><span class="mi">1</span><span class="p">])</span> <span class="o">+</span> <span class="n">top1</span><span class="p">.</span><span class="n">y</span><span class="p">;</span>
</pre></div>


<p>The code above finds two points on a line. The right and left edges need the "if" construct. These edges are vertical. They can have infinite slope, something a computer cannot represent. So I check if they have infinite slope or not. If it does, calculate two points using a "safe" method. Otherwise, the normal method can be used.</p>
<p>Now this part calculates the actual intersection points: </p>
<div class="codehilite"><pre> <span class="err">   </span> <span class="c1">// Next, we find the intersection of  these four lines</span>
<span class="err">   </span> <span class="kt">double</span> <span class="n">leftA</span> <span class="o">=</span> <span class="n">left2</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="n">left1</span><span class="p">.</span><span class="n">y</span><span class="p">;</span>
<span class="err">   </span> <span class="kt">double</span> <span class="n">leftB</span> <span class="o">=</span> <span class="n">left1</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="n">left2</span><span class="p">.</span><span class="n">x</span><span class="p">;</span>

<span class="err">   </span> <span class="kt">double</span> <span class="n">leftC</span> <span class="o">=</span> <span class="n">leftA</span><span class="o">*</span><span class="n">left1</span><span class="p">.</span><span class="n">x</span> <span class="o">+</span> <span class="n">leftB</span><span class="o">*</span><span class="n">left1</span><span class="p">.</span><span class="n">y</span><span class="p">;</span>

<span class="err">   </span> <span class="kt">double</span> <span class="n">rightA</span> <span class="o">=</span> <span class="n">right2</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="n">right1</span><span class="p">.</span><span class="n">y</span><span class="p">;</span>
<span class="err">   </span> <span class="kt">double</span> <span class="n">rightB</span> <span class="o">=</span> <span class="n">right1</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="n">right2</span><span class="p">.</span><span class="n">x</span><span class="p">;</span>

<span class="err">   </span> <span class="kt">double</span> <span class="n">rightC</span> <span class="o">=</span> <span class="n">rightA</span><span class="o">*</span><span class="n">right1</span><span class="p">.</span><span class="n">x</span> <span class="o">+</span> <span class="n">rightB</span><span class="o">*</span><span class="n">right1</span><span class="p">.</span><span class="n">y</span><span class="p">;</span>

<span class="err">   </span> <span class="kt">double</span> <span class="n">topA</span> <span class="o">=</span> <span class="n">top2</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="n">top1</span><span class="p">.</span><span class="n">y</span><span class="p">;</span>
<span class="err">   </span> <span class="kt">double</span> <span class="n">topB</span> <span class="o">=</span> <span class="n">top1</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="n">top2</span><span class="p">.</span><span class="n">x</span><span class="p">;</span>

<span class="err">   </span> <span class="kt">double</span> <span class="n">topC</span> <span class="o">=</span> <span class="n">topA</span><span class="o">*</span><span class="n">top1</span><span class="p">.</span><span class="n">x</span> <span class="o">+</span> <span class="n">topB</span><span class="o">*</span><span class="n">top1</span><span class="p">.</span><span class="n">y</span><span class="p">;</span>

<span class="err">   </span> <span class="kt">double</span> <span class="n">bottomA</span> <span class="o">=</span> <span class="n">bottom2</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="n">bottom1</span><span class="p">.</span><span class="n">y</span><span class="p">;</span>
<span class="err">   </span> <span class="kt">double</span> <span class="n">bottomB</span> <span class="o">=</span> <span class="n">bottom1</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="n">bottom2</span><span class="p">.</span><span class="n">x</span><span class="p">;</span>

<span class="err">   </span> <span class="kt">double</span> <span class="n">bottomC</span> <span class="o">=</span> <span class="n">bottomA</span><span class="o">*</span><span class="n">bottom1</span><span class="p">.</span><span class="n">x</span> <span class="o">+</span> <span class="n">bottomB</span><span class="o">*</span><span class="n">bottom1</span><span class="p">.</span><span class="n">y</span><span class="p">;</span>

<span class="err">   </span> <span class="c1">// Intersection of left and top</span>
<span class="err">   </span> <span class="kt">double</span> <span class="n">detTopLeft</span> <span class="o">=</span> <span class="n">leftA</span><span class="o">*</span><span class="n">topB</span> <span class="o">-</span> <span class="n">leftB</span><span class="o">*</span><span class="n">topA</span><span class="p">;</span>

<span class="err">   </span> <span class="n">CvPoint</span> <span class="n">ptTopLeft</span> <span class="o">=</span> <span class="n">cvPoint</span><span class="p">((</span><span class="n">topB</span><span class="o">*</span><span class="n">leftC</span> <span class="o">-</span> <span class="n">leftB</span><span class="o">*</span><span class="n">topC</span><span class="p">)</span><span class="o">/</span><span class="n">detTopLeft</span><span class="p">,</span> <span class="p">(</span><span class="n">leftA</span><span class="o">*</span><span class="n">topC</span> <span class="o">-</span> <span class="n">topA</span><span class="o">*</span><span class="n">leftC</span><span class="p">)</span><span class="o">/</span><span class="n">detTopLeft</span><span class="p">);</span>

<span class="err">   </span> <span class="c1">// Intersection of top and right</span>
<span class="err">   </span> <span class="kt">double</span> <span class="n">detTopRight</span> <span class="o">=</span> <span class="n">rightA</span><span class="o">*</span><span class="n">topB</span> <span class="o">-</span> <span class="n">rightB</span><span class="o">*</span><span class="n">topA</span><span class="p">;</span>

<span class="err">   </span> <span class="n">CvPoint</span> <span class="n">ptTopRight</span> <span class="o">=</span> <span class="n">cvPoint</span><span class="p">((</span><span class="n">topB</span><span class="o">*</span><span class="n">rightC</span><span class="o">-</span><span class="n">rightB</span><span class="o">*</span><span class="n">topC</span><span class="p">)</span><span class="o">/</span><span class="n">detTopRight</span><span class="p">,</span> <span class="p">(</span><span class="n">rightA</span><span class="o">*</span><span class="n">topC</span><span class="o">-</span><span class="n">topA</span><span class="o">*</span><span class="n">rightC</span><span class="p">)</span><span class="o">/</span><span class="n">detTopRight</span><span class="p">);</span>

<span class="err">   </span> <span class="c1">// Intersection of right and bottom</span>
<span class="err">   </span> <span class="kt">double</span> <span class="n">detBottomRight</span> <span class="o">=</span> <span class="n">rightA</span><span class="o">*</span><span class="n">bottomB</span> <span class="o">-</span> <span class="n">rightB</span><span class="o">*</span><span class="n">bottomA</span><span class="p">;</span>
<span class="err">   </span> <span class="n">CvPoint</span> <span class="n">ptBottomRight</span> <span class="o">=</span> <span class="n">cvPoint</span><span class="p">((</span><span class="n">bottomB</span><span class="o">*</span><span class="n">rightC</span><span class="o">-</span><span class="n">rightB</span><span class="o">*</span><span class="n">bottomC</span><span class="p">)</span><span class="o">/</span><span class="n">detBottomRight</span><span class="p">,</span> <span class="p">(</span><span class="n">rightA</span><span class="o">*</span><span class="n">bottomC</span><span class="o">-</span><span class="n">bottomA</span><span class="o">*</span><span class="n">rightC</span><span class="p">)</span><span class="o">/</span><span class="n">detBottomRight</span><span class="p">);</span><span class="c1">// Intersection of bottom and left</span>
<span class="err">   </span> <span class="kt">double</span> <span class="n">detBottomLeft</span> <span class="o">=</span> <span class="n">leftA</span><span class="o">*</span><span class="n">bottomB</span><span class="o">-</span><span class="n">leftB</span><span class="o">*</span><span class="n">bottomA</span><span class="p">;</span>
<span class="err">   </span> <span class="n">CvPoint</span> <span class="n">ptBottomLeft</span> <span class="o">=</span> <span class="n">cvPoint</span><span class="p">((</span><span class="n">bottomB</span><span class="o">*</span><span class="n">leftC</span><span class="o">-</span><span class="n">leftB</span><span class="o">*</span><span class="n">bottomC</span><span class="p">)</span><span class="o">/</span><span class="n">detBottomLeft</span><span class="p">,</span> <span class="p">(</span><span class="n">leftA</span><span class="o">*</span><span class="n">bottomC</span><span class="o">-</span><span class="n">bottomA</span><span class="o">*</span><span class="n">leftC</span><span class="p">)</span><span class="o">/</span><span class="n">detBottomLeft</span><span class="p">);</span>
</pre></div>


<p>Now we have the points. Now we can correct the skewed perspective. First, we find the longest edge of the puzzle. The new image will be a square of the length of the longest edge. </p>
<div class="codehilite"><pre><span class="err">   </span> <span class="kt">int</span> <span class="n">maxLength</span> <span class="o">=</span> <span class="p">(</span><span class="n">ptBottomLeft</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="n">ptBottomRight</span><span class="p">.</span><span class="n">x</span><span class="p">)</span><span class="o">*</span><span class="p">(</span><span class="n">ptBottomLeft</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="n">ptBottomRight</span><span class="p">.</span><span class="n">x</span><span class="p">)</span> <span class="o">+</span> <span class="p">(</span><span class="n">ptBottomLeft</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="n">ptBottomRight</span><span class="p">.</span><span class="n">y</span><span class="p">)</span><span class="o">*</span><span class="p">(</span><span class="n">ptBottomLeft</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="n">ptBottomRight</span><span class="p">.</span><span class="n">y</span><span class="p">);</span>
<span class="err">   </span> <span class="kt">int</span> <span class="n">temp</span> <span class="o">=</span> <span class="p">(</span><span class="n">ptTopRight</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="n">ptBottomRight</span><span class="p">.</span><span class="n">x</span><span class="p">)</span><span class="o">*</span><span class="p">(</span><span class="n">ptTopRight</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="n">ptBottomRight</span><span class="p">.</span><span class="n">x</span><span class="p">)</span> <span class="o">+</span> <span class="p">(</span><span class="n">ptTopRight</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="n">ptBottomRight</span><span class="p">.</span><span class="n">y</span><span class="p">)</span><span class="o">*</span><span class="p">(</span><span class="n">ptTopRight</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="n">ptBottomRight</span><span class="p">.</span><span class="n">y</span><span class="p">);</span>

<span class="err">   </span> <span class="k">if</span><span class="p">(</span><span class="n">temp</span><span class="o">&gt;</span><span class="n">maxLength</span><span class="p">)</span> <span class="n">maxLength</span> <span class="o">=</span> <span class="n">temp</span><span class="p">;</span>

<span class="err">   </span> <span class="n">temp</span> <span class="o">=</span> <span class="p">(</span><span class="n">ptTopRight</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="n">ptTopLeft</span><span class="p">.</span><span class="n">x</span><span class="p">)</span><span class="o">*</span><span class="p">(</span><span class="n">ptTopRight</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="n">ptTopLeft</span><span class="p">.</span><span class="n">x</span><span class="p">)</span> <span class="o">+</span> <span class="p">(</span><span class="n">ptTopRight</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="n">ptTopLeft</span><span class="p">.</span><span class="n">y</span><span class="p">)</span><span class="o">*</span><span class="p">(</span><span class="n">ptTopRight</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="n">ptTopLeft</span><span class="p">.</span><span class="n">y</span><span class="p">);</span>

<span class="err">   </span> <span class="k">if</span><span class="p">(</span><span class="n">temp</span><span class="o">&gt;</span><span class="n">maxLength</span><span class="p">)</span> <span class="n">maxLength</span> <span class="o">=</span> <span class="n">temp</span><span class="p">;</span>

<span class="err">   </span> <span class="n">temp</span> <span class="o">=</span> <span class="p">(</span><span class="n">ptBottomLeft</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="n">ptTopLeft</span><span class="p">.</span><span class="n">x</span><span class="p">)</span><span class="o">*</span><span class="p">(</span><span class="n">ptBottomLeft</span><span class="p">.</span><span class="n">x</span><span class="o">-</span><span class="n">ptTopLeft</span><span class="p">.</span><span class="n">x</span><span class="p">)</span> <span class="o">+</span> <span class="p">(</span><span class="n">ptBottomLeft</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="n">ptTopLeft</span><span class="p">.</span><span class="n">y</span><span class="p">)</span><span class="o">*</span><span class="p">(</span><span class="n">ptBottomLeft</span><span class="p">.</span><span class="n">y</span><span class="o">-</span><span class="n">ptTopLeft</span><span class="p">.</span><span class="n">y</span><span class="p">);</span>

<span class="err">   </span> <span class="k">if</span><span class="p">(</span><span class="n">temp</span><span class="o">&gt;</span><span class="n">maxLength</span><span class="p">)</span> <span class="n">maxLength</span> <span class="o">=</span> <span class="n">temp</span><span class="p">;</span>

<span class="err">   </span> <span class="n">maxLength</span> <span class="o">=</span> <span class="n">sqrt</span><span class="p">((</span><span class="kt">double</span><span class="p">)</span><span class="n">maxLength</span><span class="p">);</span>
</pre></div>


<p>Simple code. We calculate the length of each edge. Whenever we find a longer edge, we store its length squared. And finally when we have the longest edge, we do a square root to get its exact length.</p>
<p>Next, we create source and destination points: </p>
<div class="codehilite"><pre><span class="n">Point2f</span> <span class="n">src</span><span class="p">[</span><span class="mi">4</span><span class="p">],</span> <span class="n">dst</span><span class="p">[</span><span class="mi">4</span><span class="p">];</span>
<span class="n">src</span><span class="p">[</span><span class="mi">0</span><span class="p">]</span> <span class="o">=</span> <span class="n">ptTopLeft</span><span class="p">;</span><span class="err">  </span> <span class="err">   </span> <span class="err">   </span> <span class="err"> </span><span class="n">dst</span><span class="p">[</span><span class="mi">0</span><span class="p">]</span> <span class="o">=</span> <span class="n">Point2f</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">);</span>
<span class="n">src</span><span class="p">[</span><span class="mi">1</span><span class="p">]</span> <span class="o">=</span> <span class="n">ptTopRight</span><span class="p">;</span><span class="err">  </span> <span class="err">   </span> <span class="err"> </span><span class="n">dst</span><span class="p">[</span><span class="mi">1</span><span class="p">]</span> <span class="o">=</span> <span class="n">Point2f</span><span class="p">(</span><span class="n">maxLength</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="mi">0</span><span class="p">);</span>
<span class="n">src</span><span class="p">[</span><span class="mi">2</span><span class="p">]</span> <span class="o">=</span> <span class="n">ptBottomRight</span><span class="p">;</span><span class="err">  </span> <span class="err">   </span> <span class="err"> </span><span class="n">dst</span><span class="p">[</span><span class="mi">2</span><span class="p">]</span> <span class="o">=</span> <span class="n">Point2f</span><span class="p">(</span><span class="n">maxLength</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">maxLength</span><span class="o">-</span><span class="mi">1</span><span class="p">);</span>
<span class="n">src</span><span class="p">[</span><span class="mi">3</span><span class="p">]</span> <span class="o">=</span> <span class="n">ptBottomLeft</span><span class="p">;</span><span class="err">  </span> <span class="err">   </span> <span class="err"> </span><span class="n">dst</span><span class="p">[</span><span class="mi">3</span><span class="p">]</span> <span class="o">=</span> <span class="n">Point2f</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span> <span class="n">maxLength</span><span class="o">-</span><span class="mi">1</span><span class="p">);</span>
</pre></div>


<p>The top left point in the source is equivalent to the point (0,0) in the corrected image. And so on.</p>
<p>Then we create a new image and do the undistortion: </p>
<div class="codehilite"><pre><span class="n">Mat</span> <span class="n">undistorted</span> <span class="o">=</span> <span class="n">Mat</span><span class="p">(</span><span class="n">Size</span><span class="p">(</span><span class="n">maxLength</span><span class="p">,</span> <span class="n">maxLength</span><span class="p">),</span> <span class="n">CV_8UC1</span><span class="p">);</span>
<span class="n">cv</span><span class="o">::</span><span class="n">warpPerspective</span><span class="p">(</span><span class="n">original</span><span class="p">,</span> <span class="n">undistorted</span><span class="p">,</span> <span class="n">cv</span><span class="o">::</span><span class="n">getPerspectiveTransform</span><span class="p">(</span><span class="n">src</span><span class="p">,</span> <span class="n">dst</span><span class="p">),</span> <span class="n">Size</span><span class="p">(</span><span class="n">maxLength</span><span class="p">,</span> <span class="n">maxLength</span><span class="p">));</span>
</pre></div>


<p>Now the image undistorted has the corrected image. Simple as that!</p>
<figure><img alt="The undistorted SuDoKu puzzle" src="/static/img/tut/sudoku-undistorted.jpg" />  <figcaption>
<p>The undistorted SuDoKu puzzle  </p>
</figcaption>
</figure>
<h2>Summary</h2>
<p>This was a long one! In this post, we merged lines that could possibly be representing the same physical border. Then we found lines nearest to the edges. Then, we calculated intersections. And finally, we undistorted the puzzle.</p>
<p>The next step is recognizing the characters and generating an internal representation of the puzzle. Then, we can solve the puzzle finally!</p>','/static/img/tut/post-sudoku.jpg','2010-08-25',1,3,'sudoku-grabber-with-opencv-extracting-grid');
INSERT INTO "aishack_tutorial" VALUES('SuDoKu Grabber with OpenCV: Extracting digits','',30,'<p>Okay, so we''ve detected the SuDoKu grid in the previous parts. Now, we''ll try and recognize the digits already present in the image. To do that, we''ll use a simple recognition technique: the k-Nearest Neighbors algorithm. </p>
<h2>The Digit Recognition Class</h2>
<p>We''ll create a new class to that handles all digit recognition. Start by creating a new .h and a .cpp file. In my case, I''ve named them as <strong>digitrecognizer.h</strong> and <strong>digitrecognizer.cpp</strong>. Add lines to <strong>digitrecognizer.h</strong>: </p>
<div class="codehilite"><pre><span class="cp">#include &lt;cv.h&gt;</span>
<span class="cp">#include &lt;highgui.h&gt;</span>

<span class="cp">#include &lt;ml.h&gt;</span>

<span class="k">using</span> <span class="k">namespace</span> <span class="n">cv</span><span class="p">;</span>
<span class="cp">#define MAX_NUM_IMAGES    60000</span>
<span class="k">class</span> <span class="nc">DigitRecognizer</span>
<span class="p">{</span>
<span class="nl">public:</span>
<span class="err">   </span> <span class="n">DigitRecognizer</span><span class="p">();</span>

<span class="err">   </span> <span class="o">~</span><span class="n">DigitRecognizer</span><span class="p">();</span>

<span class="err">   </span> <span class="kt">bool</span> <span class="n">train</span><span class="p">(</span><span class="kt">char</span><span class="o">*</span> <span class="n">trainPath</span><span class="p">,</span> <span class="kt">char</span><span class="o">*</span> <span class="n">labelsPath</span><span class="p">);</span>

<span class="err">   </span> <span class="kt">int</span> <span class="n">classify</span><span class="p">(</span><span class="n">Mat</span> <span class="n">img</span><span class="p">);</span>

<span class="nl">private:</span>
<span class="err">   </span> <span class="n">Mat</span> <span class="n">preprocessImage</span><span class="p">(</span><span class="n">Mat</span> <span class="n">img</span><span class="p">);</span>

<span class="err">   </span> <span class="kt">int</span> <span class="n">readFlippedInteger</span><span class="p">(</span><span class="kt">FILE</span> <span class="o">*</span><span class="n">fp</span><span class="p">);</span>

<span class="nl">private:</span>
<span class="err">   </span> <span class="n">KNearest</span><span class="err">  </span> <span class="err"> </span><span class="o">*</span><span class="n">knn</span><span class="p">;</span>
<span class="err">   </span> <span class="kt">int</span> <span class="n">numRows</span><span class="p">,</span> <span class="n">numCols</span><span class="p">,</span> <span class="n">numImages</span><span class="p">;</span>

<span class="p">};</span>
</pre></div>


<p>We''ve created a constructor and a destructor the class. The <em>train()</em> function takes a path to a dataset of images and a path to its corresponding labels. It will be similar to what was had in <a href="/tutorials/k-nearest-neighbors-in-opencv/">k-Nearest Neighbors for OpenCV</a>.</p>
<p><em>classify()</em> takens an image and returns what digit it is. <em>preprocessImage()</em> does some preprocessing... contrast enhancement, centering, <em>etc. readFlippedInteger()</em> is again similar to what was done in <a href="/tutorials/k-nearest-neighbors-in-opencv/">k-Nearest Neighbors for OpenCV</a>. It has something to do with the endiannesss of your processor and the file-format of the dataset we''re using.</p>
<p><em>knn</em> is a k-Nearest Neighbor data structure... and <em>numRows</em>, <em>numCols</em> and <em>numImages</em> stores the number of rows and columns in the training dataset. <em>numImages</em> stores the number of images in the dataset. </p>
<h2>Defining the class</h2>
<p>Open <strong>digitrecognizer.cpp</strong> and add these lines: </p>
<div class="codehilite"><pre><span class="n">DigitRecognizer</span><span class="o">::</span><span class="n">DigitRecognizer</span><span class="p">()</span>
<span class="p">{</span>
<span class="err">   </span> <span class="n">knn</span> <span class="o">=</span> <span class="k">new</span> <span class="n">KNearest</span><span class="p">();</span>

<span class="p">}</span>

<span class="n">DigitRecognizer</span><span class="o">::~</span><span class="n">DigitRecognizer</span><span class="p">()</span>
<span class="p">{</span>
<span class="err">   </span> <span class="k">delete</span> <span class="n">knn</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>When you create a new instance of this class, you allocate memory for the k-Nearest Neighbor data structure. When you delete this class, you also delete the <em>knn</em>''s memory.</p>
<p>Next, add a definition for the _readFlippedInteger _and _train _functions: </p>
<div class="codehilite"><pre><span class="kt">int</span> <span class="n">DigitRecognizer</span><span class="o">::</span><span class="n">readFlippedInteger</span><span class="p">(</span><span class="kt">FILE</span> <span class="o">*</span><span class="n">fp</span><span class="p">)</span>
<span class="p">{</span>
<span class="err">   </span> <span class="kt">int</span> <span class="n">ret</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span>

<span class="err">   </span> <span class="n">BYTE</span> <span class="o">*</span><span class="n">temp</span><span class="p">;</span>

<span class="err">   </span> <span class="n">temp</span> <span class="o">=</span> <span class="p">(</span><span class="n">BYTE</span><span class="o">*</span><span class="p">)(</span><span class="o">&amp;</span><span class="n">ret</span><span class="p">);</span>
<span class="err">   </span> <span class="n">fread</span><span class="p">(</span><span class="o">&amp;</span><span class="n">temp</span><span class="p">[</span><span class="mi">3</span><span class="p">],</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">BYTE</span><span class="p">),</span> <span class="mi">1</span><span class="p">,</span> <span class="n">fp</span><span class="p">);</span>
<span class="err">   </span> <span class="n">fread</span><span class="p">(</span><span class="o">&amp;</span><span class="n">temp</span><span class="p">[</span><span class="mi">2</span><span class="p">],</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">BYTE</span><span class="p">),</span> <span class="mi">1</span><span class="p">,</span> <span class="n">fp</span><span class="p">);</span>
<span class="err">   </span> <span class="n">fread</span><span class="p">(</span><span class="o">&amp;</span><span class="n">temp</span><span class="p">[</span><span class="mi">1</span><span class="p">],</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">BYTE</span><span class="p">),</span> <span class="mi">1</span><span class="p">,</span> <span class="n">fp</span><span class="p">);</span>

<span class="err">   </span> <span class="n">fread</span><span class="p">(</span><span class="o">&amp;</span><span class="n">temp</span><span class="p">[</span><span class="mi">0</span><span class="p">],</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">BYTE</span><span class="p">),</span> <span class="mi">1</span><span class="p">,</span> <span class="n">fp</span><span class="p">);</span>

<span class="err">   </span> <span class="k">return</span> <span class="n">ret</span><span class="p">;</span>

<span class="p">}</span>

<span class="kt">bool</span> <span class="n">DigitRecognizer</span><span class="o">::</span><span class="n">train</span><span class="p">(</span><span class="kt">char</span> <span class="o">*</span><span class="n">trainPath</span><span class="p">,</span> <span class="kt">char</span> <span class="o">*</span><span class="n">labelsPath</span><span class="p">)</span>
<span class="p">{</span>
<span class="err">   </span> <span class="kt">FILE</span> <span class="o">*</span><span class="n">fp</span> <span class="o">=</span> <span class="n">fopen</span><span class="p">(</span><span class="n">trainPath</span><span class="p">,</span> <span class="s">&quot;rb&quot;</span><span class="p">);</span>

<span class="err">   </span> <span class="kt">FILE</span> <span class="o">*</span><span class="n">fp2</span> <span class="o">=</span> <span class="n">fopen</span><span class="p">(</span><span class="n">labelsPath</span><span class="p">,</span> <span class="s">&quot;rb&quot;</span><span class="p">);</span>

<span class="err">   </span> <span class="k">if</span><span class="p">(</span><span class="o">!</span><span class="n">fp</span> <span class="o">||</span> <span class="o">!</span><span class="n">fp2</span><span class="p">)</span>

<span class="err">       </span> <span class="k">return</span> <span class="nb">false</span><span class="p">;</span>

<span class="err">   </span> <span class="c1">// Read bytes in flipped order</span>
<span class="err">   </span> <span class="kt">int</span> <span class="n">magicNumber</span> <span class="o">=</span> <span class="n">readFlippedInteger</span><span class="p">(</span><span class="n">fp</span><span class="p">);</span>
<span class="err">   </span> <span class="n">numImages</span> <span class="o">=</span> <span class="n">readFlippedInteger</span><span class="p">(</span><span class="n">fp</span><span class="p">);</span>
<span class="err">   </span> <span class="n">numRows</span> <span class="o">=</span> <span class="n">readFlippedInteger</span><span class="p">(</span><span class="n">fp</span><span class="p">);</span>

<span class="err">   </span> <span class="n">numCols</span> <span class="o">=</span> <span class="n">readFlippedInteger</span><span class="p">(</span><span class="n">fp</span><span class="p">);</span>

<span class="err">   </span> <span class="n">fseek</span><span class="p">(</span><span class="n">fp2</span><span class="p">,</span> <span class="mh">0x08</span><span class="p">,</span> <span class="n">SEEK_SET</span><span class="p">);</span>


<span class="err">   </span> <span class="k">if</span><span class="p">(</span><span class="n">numImages</span> <span class="o">&gt;</span> <span class="n">MAX_NUM_IMAGES</span><span class="p">)</span> <span class="n">numImages</span> <span class="o">=</span> <span class="n">MAX_NUM_IMAGES</span><span class="p">;</span>

<span class="err">   </span> <span class="c1">//////////////////////////////////////////////////////////////////</span>
<span class="err">   </span> <span class="c1">// Go through each training data entry and save a</span>

<span class="err">   </span> <span class="c1">// label for each digit</span>

<span class="err">   </span> <span class="kt">int</span> <span class="n">size</span> <span class="o">=</span> <span class="n">numRows</span><span class="o">*</span><span class="n">numCols</span><span class="p">;</span>

<span class="err">   </span> <span class="n">CvMat</span> <span class="o">*</span><span class="n">trainingVectors</span> <span class="o">=</span> <span class="n">cvCreateMat</span><span class="p">(</span><span class="n">numImages</span><span class="p">,</span> <span class="n">size</span><span class="p">,</span> <span class="n">CV_32FC1</span><span class="p">);</span>

<span class="err">   </span> <span class="n">CvMat</span> <span class="o">*</span><span class="n">trainingClasses</span> <span class="o">=</span> <span class="n">cvCreateMat</span><span class="p">(</span><span class="n">numImages</span><span class="p">,</span> <span class="mi">1</span><span class="p">,</span> <span class="n">CV_32FC1</span><span class="p">);</span>

<span class="err">   </span> <span class="n">memset</span><span class="p">(</span><span class="n">trainingClasses</span><span class="o">-&gt;</span><span class="n">data</span><span class="p">.</span><span class="n">ptr</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="k">sizeof</span><span class="p">(</span><span class="kt">float</span><span class="p">)</span><span class="o">*</span><span class="n">numImages</span><span class="p">);</span>

<span class="err">   </span> <span class="n">BYTE</span> <span class="o">*</span><span class="n">temp</span> <span class="o">=</span> <span class="k">new</span> <span class="n">BYTE</span><span class="p">[</span><span class="n">size</span><span class="p">];</span>
<span class="err">   </span> <span class="n">BYTE</span> <span class="n">tempClass</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span>
<span class="err">   </span> <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">i</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">i</span><span class="o">&lt;</span><span class="n">numImages</span><span class="p">;</span><span class="n">i</span><span class="o">++</span><span class="p">)</span>
<span class="err">   </span> <span class="p">{</span>

<span class="err">       </span> <span class="n">fread</span><span class="p">((</span><span class="kt">void</span><span class="o">*</span><span class="p">)</span><span class="n">temp</span><span class="p">,</span> <span class="n">size</span><span class="p">,</span> <span class="mi">1</span><span class="p">,</span> <span class="n">fp</span><span class="p">);</span>

<span class="err">       </span> <span class="n">fread</span><span class="p">((</span><span class="kt">void</span><span class="o">*</span><span class="p">)(</span><span class="o">&amp;</span><span class="n">tempClass</span><span class="p">),</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">BYTE</span><span class="p">),</span> <span class="mi">1</span><span class="p">,</span> <span class="n">fp2</span><span class="p">);</span>

<span class="err">       </span> <span class="n">trainingClasses</span><span class="o">-&gt;</span><span class="n">data</span><span class="p">.</span><span class="n">fl</span><span class="p">[</span><span class="n">i</span><span class="p">]</span> <span class="o">=</span> <span class="n">tempClass</span><span class="p">;</span>

<span class="err">       </span> <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">k</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">k</span><span class="o">&lt;</span><span class="n">size</span><span class="p">;</span><span class="n">k</span><span class="o">++</span><span class="p">)</span>
<span class="err">           </span> <span class="n">trainingVectors</span><span class="o">-&gt;</span><span class="n">data</span><span class="p">.</span><span class="n">fl</span><span class="p">[</span><span class="n">i</span><span class="o">*</span><span class="n">size</span><span class="o">+</span><span class="n">k</span><span class="p">]</span> <span class="o">=</span> <span class="n">temp</span><span class="p">[</span><span class="n">k</span><span class="p">];</span> <span class="c1">///sumofsquares;</span>

<span class="err">   </span> <span class="p">}</span>

<span class="err">   </span> <span class="n">knn</span><span class="o">-&gt;</span><span class="n">train</span><span class="p">(</span><span class="n">trainingVectors</span><span class="p">,</span> <span class="n">trainingClasses</span><span class="p">);</span>
<span class="err">   </span> <span class="n">fclose</span><span class="p">(</span><span class="n">fp</span><span class="p">);</span>

<span class="err">   </span> <span class="n">fclose</span><span class="p">(</span><span class="n">fp2</span><span class="p">);</span>

<span class="err">   </span> <span class="k">return</span> <span class="nb">true</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>For this series, I''ll use the <a href="http://yann.lecun.com/exdb/mnist/">MNIST dataset</a> of handwritten digits. I''ve used the data format used by them to read the file. Have a look at <a href="/tutorials/k-nearest-neighbors-in-opencv/">k-Nearest Neighbors for OpenCV</a> for a more detailed explanation about how the above code works.</p>
<p>Now, for the very simple function: <em>classify()</em>! </p>
<div class="codehilite"><pre><span class="kt">int</span> <span class="n">DigitRecognizer</span><span class="o">::</span><span class="n">classify</span><span class="p">(</span><span class="n">cv</span><span class="o">::</span><span class="n">Mat</span> <span class="n">img</span><span class="p">)</span>
<span class="p">{</span>
<span class="err">   </span> <span class="n">Mat</span> <span class="n">cloneImg</span> <span class="o">=</span> <span class="n">preprocessImage</span><span class="p">(</span><span class="n">img</span><span class="p">);</span>
<span class="err">   </span> <span class="k">return</span> <span class="n">knn</span><span class="o">-&gt;</span><span class="n">find_nearest</span><span class="p">(</span><span class="n">Mat_</span><span class="o">&lt;</span><span class="kt">float</span><span class="o">&gt;</span><span class="p">(</span><span class="n">cloneImg</span><span class="p">),</span> <span class="mi">1</span><span class="p">);</span>
<span class="p">}</span>
</pre></div>


<p>This simply creates a clone preprocessed image. This image is sent into the k-Nearest Neighbor structure for recognition. Now we''ll handle the preprocessing. </p>
<h2>Preprocessing images</h2>
<p>Sending images directly to k-Nearest Neighbors is not a good idea. A little bit of work on the image can increase accuracy. Here, we''ll center the actual digit in the image.</p>
<p><img alt="Preprocessing - Centering the image" src="/static/img/tut/knn-centering-preprocessing.jpg" /></p>
<p>Why? Because the MNIST dataset has been made in such a way - all digits are centered by their bounding box.</p>
<p>After centering, we''ll fill things around the edges with black. This will eliminate any extra noise.</p>
<p>We''ll divide the task into three parts: </p>
<ol>
<li>Find approximate bounding box of the digit</li>
<li>Center the contents inside the bounding box</li>
<li>Flood fill edges with black color</li>
</ol>
<h3>Finding the approximate bounding box</h3>
<p>The idea is to start at the center of the image and move in all four directions. So you''ll go up from the center, to the right, to the left and towards the bottom.</p>
<p>Lets say, you just moved one pixel up, towards the top of the image. You''ll calculate the sum of all pixels in that row. If this sum is less than some value, you assume you''ve reached the top boundary. Otherwise, you keep moving on.</p>
<p>We do a similar summation for bottom, left and right. For left and right, you sum a column instead of a row. Here''s the code that does this: </p>
<div class="codehilite"><pre><span class="n">Mat</span> <span class="n">DigitRecognizer</span><span class="o">::</span><span class="n">preprocessImage</span><span class="p">(</span><span class="n">Mat</span> <span class="n">img</span><span class="p">)</span>
<span class="p">{</span>

<span class="err">   </span> <span class="kt">int</span> <span class="n">rowTop</span><span class="o">=-</span><span class="mi">1</span><span class="p">,</span> <span class="n">rowBottom</span><span class="o">=-</span><span class="mi">1</span><span class="p">,</span> <span class="n">colLeft</span><span class="o">=-</span><span class="mi">1</span><span class="p">,</span> <span class="n">colRight</span><span class="o">=-</span><span class="mi">1</span><span class="p">;</span>

<span class="err">   </span> <span class="n">Mat</span> <span class="n">temp</span><span class="p">;</span>
<span class="err">   </span> <span class="kt">int</span> <span class="n">thresholdBottom</span> <span class="o">=</span> <span class="mi">50</span><span class="p">;</span>
<span class="err">   </span> <span class="kt">int</span> <span class="n">thresholdTop</span> <span class="o">=</span> <span class="mi">50</span><span class="p">;</span>
<span class="err">   </span> <span class="kt">int</span> <span class="n">thresholdLeft</span> <span class="o">=</span> <span class="mi">50</span><span class="p">;</span>
<span class="err">   </span> <span class="kt">int</span> <span class="n">thresholdRight</span> <span class="o">=</span> <span class="mi">50</span><span class="p">;</span>
<span class="err">   </span> <span class="kt">int</span> <span class="n">center</span> <span class="o">=</span> <span class="n">img</span><span class="p">.</span><span class="n">rows</span><span class="o">/</span><span class="mi">2</span><span class="p">;</span>
<span class="err">   </span> <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">i</span><span class="o">=</span><span class="n">center</span><span class="p">;</span><span class="n">i</span><span class="o">&lt;</span><span class="n">img</span><span class="p">.</span><span class="n">rows</span><span class="p">;</span><span class="n">i</span><span class="o">++</span><span class="p">)</span>
<span class="err">   </span> <span class="p">{</span>
<span class="err">       </span> <span class="k">if</span><span class="p">(</span><span class="n">rowBottom</span><span class="o">==-</span><span class="mi">1</span><span class="p">)</span>
<span class="err">       </span> <span class="p">{</span>
<span class="err">           </span> <span class="n">temp</span> <span class="o">=</span> <span class="n">img</span><span class="p">.</span><span class="n">row</span><span class="p">(</span><span class="n">i</span><span class="p">);</span>
<span class="err">           </span> <span class="n">IplImage</span> <span class="n">stub</span> <span class="o">=</span> <span class="n">temp</span><span class="p">;</span>
<span class="err">           </span> <span class="k">if</span><span class="p">(</span><span class="n">cvSum</span><span class="p">(</span><span class="o">&amp;</span><span class="n">stub</span><span class="p">).</span><span class="n">val</span><span class="p">[</span><span class="mi">0</span><span class="p">]</span> <span class="o">&lt;</span> <span class="n">thresholdBottom</span> <span class="o">||</span> <span class="n">i</span><span class="o">==</span><span class="n">img</span><span class="p">.</span><span class="n">rows</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span>
<span class="err">               </span> <span class="n">rowBottom</span> <span class="o">=</span> <span class="n">i</span><span class="p">;</span>

<span class="err">       </span> <span class="p">}</span>

<span class="err">       </span> <span class="k">if</span><span class="p">(</span><span class="n">rowTop</span><span class="o">==-</span><span class="mi">1</span><span class="p">)</span>
<span class="err">       </span> <span class="p">{</span>
<span class="err">           </span> <span class="n">temp</span> <span class="o">=</span> <span class="n">img</span><span class="p">.</span><span class="n">row</span><span class="p">(</span><span class="n">img</span><span class="p">.</span><span class="n">rows</span><span class="o">-</span><span class="n">i</span><span class="p">);</span>
<span class="err">           </span> <span class="n">IplImage</span> <span class="n">stub</span> <span class="o">=</span> <span class="n">temp</span><span class="p">;</span>
<span class="err">           </span> <span class="k">if</span><span class="p">(</span><span class="n">cvSum</span><span class="p">(</span><span class="o">&amp;</span><span class="n">stub</span><span class="p">).</span><span class="n">val</span><span class="p">[</span><span class="mi">0</span><span class="p">]</span> <span class="o">&lt;</span> <span class="n">thresholdTop</span> <span class="o">||</span> <span class="n">i</span><span class="o">==</span><span class="n">img</span><span class="p">.</span><span class="n">rows</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span>
<span class="err">               </span> <span class="n">rowTop</span> <span class="o">=</span> <span class="n">img</span><span class="p">.</span><span class="n">rows</span><span class="o">-</span><span class="n">i</span><span class="p">;</span>

<span class="err">       </span> <span class="p">}</span>

<span class="err">       </span> <span class="k">if</span><span class="p">(</span><span class="n">colRight</span><span class="o">==-</span><span class="mi">1</span><span class="p">)</span>
<span class="err">       </span> <span class="p">{</span>
<span class="err">           </span> <span class="n">temp</span> <span class="o">=</span> <span class="n">img</span><span class="p">.</span><span class="n">col</span><span class="p">(</span><span class="n">i</span><span class="p">);</span>
<span class="err">           </span> <span class="n">IplImage</span> <span class="n">stub</span> <span class="o">=</span> <span class="n">temp</span><span class="p">;</span>
<span class="err">           </span> <span class="k">if</span><span class="p">(</span><span class="n">cvSum</span><span class="p">(</span><span class="o">&amp;</span><span class="n">stub</span><span class="p">).</span><span class="n">val</span><span class="p">[</span><span class="mi">0</span><span class="p">]</span> <span class="o">&lt;</span> <span class="n">thresholdRight</span><span class="o">||</span> <span class="n">i</span><span class="o">==</span><span class="n">img</span><span class="p">.</span><span class="n">cols</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span>
<span class="err">               </span> <span class="n">colRight</span> <span class="o">=</span> <span class="n">i</span><span class="p">;</span>

<span class="err">       </span> <span class="p">}</span>

<span class="err">       </span> <span class="k">if</span><span class="p">(</span><span class="n">colLeft</span><span class="o">==-</span><span class="mi">1</span><span class="p">)</span>
<span class="err">       </span> <span class="p">{</span>
<span class="err">           </span> <span class="n">temp</span> <span class="o">=</span> <span class="n">img</span><span class="p">.</span><span class="n">col</span><span class="p">(</span><span class="n">img</span><span class="p">.</span><span class="n">cols</span><span class="o">-</span><span class="n">i</span><span class="p">);</span>
<span class="err">           </span> <span class="n">IplImage</span> <span class="n">stub</span> <span class="o">=</span> <span class="n">temp</span><span class="p">;</span>
<span class="err">           </span> <span class="k">if</span><span class="p">(</span><span class="n">cvSum</span><span class="p">(</span><span class="o">&amp;</span><span class="n">stub</span><span class="p">).</span><span class="n">val</span><span class="p">[</span><span class="mi">0</span><span class="p">]</span> <span class="o">&lt;</span> <span class="n">thresholdLeft</span><span class="o">||</span> <span class="n">i</span><span class="o">==</span><span class="n">img</span><span class="p">.</span><span class="n">cols</span><span class="o">-</span><span class="mi">1</span><span class="p">)</span>
<span class="err">               </span> <span class="n">colLeft</span> <span class="o">=</span> <span class="n">img</span><span class="p">.</span><span class="n">cols</span><span class="o">-</span><span class="n">i</span><span class="p">;</span>
<span class="err">       </span> <span class="p">}</span>
<span class="err">   </span> <span class="p">}</span>
</pre></div>


<p>Startled? Let me explain. rowTop, rowBottom, colLeft and colRight mark the bounding box''s top row, bottom row, etc. Initially, they''re marked as -1 (representing no boundary was found) If the sum of a row/column is less than the corresponding <em>threshold*</em> then it is assumed to be the boundary.</p>
<p>Here, we''re assuming all images have the same height and width. So we calculate a "center". The loop starts at "center" and goes till the number of rows. </p>
<p>Then, we check if the bottom boundary has been detected or not (based on -1). If now, a pointer to the i''th row is generated. Then we convert it into IplImage to use cvSum. (For some reason, there is no C++ version for this function on my system). If the sum is less than the threshold OR if we read the extreme bottom, we set the row bottom.</p>
<p>Each of the other three if- segments are similar, except for minor differences. For top, we use the (img.rows-i)th row (i goes from center-img.rows... but we need numbers in the reverse order). For left and right, we calculate sum over columns instead of rows. </p>
<h3>Center the bounding box''s contents</h3>
<p>Now, we know the size of the bounding box. We also know the size of the image. We can easily center the image: </p>
<div class="codehilite"><pre><span class="err">   </span> <span class="n">Mat</span> <span class="n">newImg</span><span class="p">;</span>

<span class="err">   </span> <span class="n">newImg</span> <span class="o">=</span> <span class="n">newImg</span><span class="p">.</span><span class="n">zeros</span><span class="p">(</span><span class="n">img</span><span class="p">.</span><span class="n">rows</span><span class="p">,</span> <span class="n">img</span><span class="p">.</span><span class="n">cols</span><span class="p">,</span> <span class="n">CV_8UC1</span><span class="p">);</span>

<span class="err">   </span> <span class="kt">int</span> <span class="n">startAtX</span> <span class="o">=</span> <span class="p">(</span><span class="n">newImg</span><span class="p">.</span><span class="n">cols</span><span class="o">/</span><span class="mi">2</span><span class="p">)</span><span class="o">-</span><span class="p">(</span><span class="n">colRight</span><span class="o">-</span><span class="n">colLeft</span><span class="p">)</span><span class="o">/</span><span class="mi">2</span><span class="p">;</span>

<span class="err">   </span> <span class="kt">int</span> <span class="n">startAtY</span> <span class="o">=</span> <span class="p">(</span><span class="n">newImg</span><span class="p">.</span><span class="n">rows</span><span class="o">/</span><span class="mi">2</span><span class="p">)</span><span class="o">-</span><span class="p">(</span><span class="n">rowBottom</span><span class="o">-</span><span class="n">rowTop</span><span class="p">)</span><span class="o">/</span><span class="mi">2</span><span class="p">;</span>

<span class="err">   </span> <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">y</span><span class="o">=</span><span class="n">startAtY</span><span class="p">;</span><span class="n">y</span><span class="o">&lt;</span><span class="p">(</span><span class="n">newImg</span><span class="p">.</span><span class="n">rows</span><span class="o">/</span><span class="mi">2</span><span class="p">)</span><span class="o">+</span><span class="p">(</span><span class="n">rowBottom</span><span class="o">-</span><span class="n">rowTop</span><span class="p">)</span><span class="o">/</span><span class="mi">2</span><span class="p">;</span><span class="n">y</span><span class="o">++</span><span class="p">)</span>
<span class="err">   </span> <span class="p">{</span>
<span class="err">       </span> <span class="n">uchar</span> <span class="o">*</span><span class="n">ptr</span> <span class="o">=</span> <span class="n">newImg</span><span class="p">.</span><span class="n">ptr</span><span class="o">&lt;</span><span class="n">uchar</span><span class="o">&gt;</span><span class="p">(</span><span class="n">y</span><span class="p">);</span>
<span class="err">       </span> <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">x</span><span class="o">=</span><span class="n">startAtX</span><span class="p">;</span><span class="n">x</span><span class="o">&lt;</span><span class="p">(</span><span class="n">newImg</span><span class="p">.</span><span class="n">cols</span><span class="o">/</span><span class="mi">2</span><span class="p">)</span><span class="o">+</span><span class="p">(</span><span class="n">colRight</span><span class="o">-</span><span class="n">colLeft</span><span class="p">)</span><span class="o">/</span><span class="mi">2</span><span class="p">;</span><span class="n">x</span><span class="o">++</span><span class="p">)</span>
<span class="err">       </span> <span class="p">{</span>
<span class="err">           </span> <span class="n">ptr</span><span class="p">[</span><span class="n">x</span><span class="p">]</span> <span class="o">=</span> <span class="n">img</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="n">uchar</span><span class="o">&gt;</span><span class="p">(</span><span class="n">rowTop</span><span class="o">+</span><span class="p">(</span><span class="n">y</span><span class="o">-</span><span class="n">startAtY</span><span class="p">),</span><span class="n">colLeft</span><span class="o">+</span><span class="p">(</span><span class="n">x</span><span class="o">-</span><span class="n">startAtX</span><span class="p">));</span>
<span class="err">       </span> <span class="p">}</span>
<span class="err">   </span> <span class="p">}</span>
</pre></div>


<p>We create a new image that''s the same size as the original. Then, set startAtX to (the image''s center x-width of bounding box/2). Similarly for set startAtY.</p>
<p>Then we simply read pixels from the original into <em>newImg</em>. </p>
<h3>Filling black along the edges</h3>
<div class="codehilite"><pre><span class="err">   </span> <span class="n">Mat</span> <span class="n">cloneImg</span> <span class="o">=</span> <span class="n">Mat</span><span class="p">(</span><span class="n">numRows</span><span class="p">,</span> <span class="n">numCols</span><span class="p">,</span> <span class="n">CV_8UC1</span><span class="p">);</span>

<span class="err">   </span> <span class="n">resize</span><span class="p">(</span><span class="n">newImg</span><span class="p">,</span> <span class="n">cloneImg</span><span class="p">,</span> <span class="n">Size</span><span class="p">(</span><span class="n">numCols</span><span class="p">,</span> <span class="n">numRows</span><span class="p">));</span>

<span class="err">   </span> <span class="c1">// Now fill along the borders</span>
<span class="err">   </span> <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">i</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">i</span><span class="o">&lt;</span><span class="n">cloneImg</span><span class="p">.</span><span class="n">rows</span><span class="p">;</span><span class="n">i</span><span class="o">++</span><span class="p">)</span>
<span class="err">   </span> <span class="p">{</span>
<span class="err">       </span> <span class="n">floodFill</span><span class="p">(</span><span class="n">cloneImg</span><span class="p">,</span> <span class="n">cvPoint</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span> <span class="n">i</span><span class="p">),</span> <span class="n">cvScalar</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">));</span>

<span class="err">       </span> <span class="n">floodFill</span><span class="p">(</span><span class="n">cloneImg</span><span class="p">,</span> <span class="n">cvPoint</span><span class="p">(</span><span class="n">cloneImg</span><span class="p">.</span><span class="n">cols</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">i</span><span class="p">),</span> <span class="n">cvScalar</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">));</span>

<span class="err">       </span> <span class="n">floodFill</span><span class="p">(</span><span class="n">cloneImg</span><span class="p">,</span> <span class="n">cvPoint</span><span class="p">(</span><span class="n">i</span><span class="p">,</span> <span class="mi">0</span><span class="p">),</span> <span class="n">cvScalar</span><span class="p">(</span><span class="mi">0</span><span class="p">));</span>
<span class="err">       </span> <span class="n">floodFill</span><span class="p">(</span><span class="n">cloneImg</span><span class="p">,</span> <span class="n">cvPoint</span><span class="p">(</span><span class="n">i</span><span class="p">,</span> <span class="n">cloneImg</span><span class="p">.</span><span class="n">rows</span><span class="o">-</span><span class="mi">1</span><span class="p">),</span> <span class="n">cvScalar</span><span class="p">(</span><span class="mi">0</span><span class="p">));</span>
<span class="err">   </span> <span class="p">}</span>
</pre></div>


<p>We''re creating a new image. This time, the image is of the size of the training images (note the numCols, numRows). We iterate from 0 to the number of rows in <em>cloneImg</em>. And we flood fill black (0, 0, 0) on the top edge, bottom edge, right edge and the left edge. </p>
<h3>The final return</h3>
<p>Finally, we reshape the numCols*numRows image into a single row image. The k-Nearest Neighbors algorithm expects images to be in this format.</p>
<div class="codehilite"><pre>    <span class="n">cloneImg</span> <span class="o">=</span> <span class="n">cloneImg</span><span class="p">.</span><span class="n">reshape</span><span class="p">(</span><span class="mi">1</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>

    <span class="k">return</span> <span class="n">cloneImg</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>The first 1 is the number of channels you want. The second 1 is for the number of rows you want. </p>
<h2>Summary</h2>
<p>A long article. Have a look at the code, and try connecting it with your SuDoKu solver program.</p>','/static/img/tut/post-sudoku.jpg','2010-08-25',1,3,'sudoku-grabber-with-opencv-extracting-digits');
INSERT INTO "aishack_tutorial" VALUES('SuDoKu Grabber with OpenCV: Recognizing digits','',31,'<p>In the previous article (<a href="/tutorials/detecting-a-sudoku-puzzle-in-an-image-part-3/">Detecting a SuDoKu puzzle in an Image, Part 3</a>), we created the DigitRecognizer class.It had functions for training and classifying images as digits. We also put some pre-processing code to ensure the image is at the center. Now, we''ll combine it with our existing program. We''ll also use the merged lines we created earlier. </p>
<h2>Training the classifier</h2>
<p>We''ll start where we left the original SuDoKu program. Your last line was probably: </p>
<div class="codehilite"><pre><span class="n">cv</span><span class="o">::</span><span class="n">warpPerspective</span><span class="p">(</span><span class="n">original</span><span class="p">,</span> <span class="n">undistorted</span><span class="p">,</span> <span class="n">cv</span><span class="o">::</span><span class="n">getPerspectiveTransform</span><span class="p">(</span><span class="n">src</span><span class="p">,</span> <span class="n">dst</span><span class="p">),</span> <span class="n">Size</span><span class="p">(</span><span class="n">maxLength</span><span class="p">,</span> <span class="n">maxLength</span><span class="p">));</span>
</pre></div>


<p>Unless you tried hacking a bit yourself!</p>
<p>First thing we''ll do is create a thresholded image. Till now, the text is in black. But we want it to be white. So, we''ll create a duplicate and use an inverted threshold: </p>
<div class="codehilite"><pre><span class="n">Mat</span> <span class="n">undistortedThreshed</span> <span class="o">=</span> <span class="n">undistorted</span><span class="p">.</span><span class="n">clone</span><span class="p">();</span>
<span class="n">adaptiveThreshold</span><span class="p">(</span><span class="n">undistorted</span><span class="p">,</span> <span class="n">undistortedThreshed</span><span class="p">,</span> <span class="mi">255</span><span class="p">,</span> <span class="n">CV_ADAPTIVE_THRESH_GAUSSIAN_C</span><span class="p">,</span> <span class="n">CV_THRESH_BINARY_INV</span><span class="p">,</span> <span class="mi">101</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>
</pre></div>


<p>I''ve used the adaptive threshold (with a block size of 101 to calculate the dynamic threshold value) to keep the effects of lighting from spoiling the thresholding.</p>
<p>Had I used standard thresholding, it would look something like this: </p>
<p><img alt="Bad thresholding with a static threshold value" src="/static/img/tut/sudoku-bad-thresholding.jpg" /></p>
<p>With the adaptive thresholding, the thresholded image looks like this: </p>
<p><img alt="Good adaptive thresholding!" src="/static/img/tut/sudoku-good-thresholding.jpg" /></p>
<p>Next, we create an instance of the DigitRecognizer class and train it: </p>
<div class="codehilite"><pre><span class="n">DigitRecognizer</span> <span class="o">*</span><span class="n">dr</span> <span class="o">=</span> <span class="k">new</span> <span class="n">DigitRecognizer</span><span class="p">();</span>
<span class="kt">bool</span> <span class="n">b</span> <span class="o">=</span> <span class="n">dr</span><span class="o">-&gt;</span><span class="n">train</span><span class="p">(</span><span class="s">&quot;D:/Test/Character Recognition/train-images.idx3-ubyte&quot;</span><span class="p">,</span> <span class="s">&quot;D:/Test/Character Recognition/train-labels.idx1-ubyte&quot;</span><span class="p">);</span>
</pre></div>


<p>If you want you can put a check on ''b''. If true, the training was successful, otherwise its false.</p>
<p>Then, we create a small image that will hold one SuDoKu cell: </p>
<div class="codehilite"><pre><span class="kt">int</span> <span class="n">dist</span> <span class="o">=</span> <span class="n">ceil</span><span class="p">((</span><span class="kt">double</span><span class="p">)</span><span class="n">maxLength</span><span class="o">/</span><span class="mi">9</span><span class="p">);</span>
<span class="n">Mat</span> <span class="n">currentCell</span> <span class="o">=</span> <span class="n">Mat</span><span class="p">(</span><span class="n">dist</span><span class="p">,</span> <span class="n">dist</span><span class="p">,</span> <span class="n">CV_8UC1</span><span class="p">);</span>
</pre></div>


<p>Now, we iterate through each cell: </p>
<div class="codehilite"><pre><span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">j</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">j</span><span class="o">&lt;</span><span class="mi">9</span><span class="p">;</span><span class="n">j</span><span class="o">++</span><span class="p">)</span>
<span class="p">{</span>
<span class="err">   </span> <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">i</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">i</span><span class="o">&lt;</span><span class="mi">9</span><span class="p">;</span><span class="n">i</span><span class="o">++</span><span class="p">)</span>
<span class="err">   </span> <span class="p">{</span>
</pre></div>


<p>Each of these cells correspond to certain pixels. We copy these pixels into currentCell: </p>
<div class="codehilite"><pre><span class="err">       </span> <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">y</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">y</span><span class="o">&lt;</span><span class="n">dist</span> <span class="o">&amp;&amp;</span> <span class="n">j</span><span class="o">*</span><span class="n">dist</span><span class="o">+</span><span class="n">y</span><span class="o">&lt;</span><span class="n">undistortedThreshed</span><span class="p">.</span><span class="n">cols</span><span class="p">;</span><span class="n">y</span><span class="o">++</span><span class="p">)</span>
<span class="err"> </span> <span class="err">  </span> <span class="err">  </span> <span class="p">{</span>

<span class="err">           </span> <span class="n">uchar</span><span class="o">*</span> <span class="n">ptr</span> <span class="o">=</span> <span class="n">currentCell</span><span class="p">.</span><span class="n">ptr</span><span class="p">(</span><span class="n">y</span><span class="p">);</span>

<span class="err">           </span> <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">x</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">x</span><span class="o">&lt;</span><span class="n">dist</span> <span class="o">&amp;&amp;</span> <span class="n">i</span><span class="o">*</span><span class="n">dist</span><span class="o">+</span><span class="n">x</span><span class="o">&lt;</span><span class="n">undistortedThreshed</span><span class="p">.</span><span class="n">rows</span><span class="p">;</span><span class="n">x</span><span class="o">++</span><span class="p">)</span>
<span class="err">           </span> <span class="p">{</span>
<span class="err">               </span> <span class="n">ptr</span><span class="p">[</span><span class="n">x</span><span class="p">]</span> <span class="o">=</span> <span class="n">undistortedThreshed</span><span class="p">.</span><span class="n">at</span><span class="o">&lt;</span><span class="n">uchar</span><span class="o">&gt;</span><span class="p">(</span><span class="n">j</span><span class="o">*</span><span class="n">dist</span><span class="o">+</span><span class="n">y</span><span class="p">,</span> <span class="n">i</span><span class="o">*</span><span class="n">dist</span><span class="o">+</span><span class="n">x</span><span class="p">);</span>
<span class="err">           </span> <span class="p">}</span>
<span class="err">       </span> <span class="p">}</span>
</pre></div>


<p>Once we''ve copied the pixels, we calculate the number of white pixels on it. If the number is less, it''s probably a blank cell. Otherwise, it''s probably a numbered cell. </p>
<div class="codehilite"><pre><span class="err">       </span> <span class="n">Moments</span> <span class="n">m</span> <span class="o">=</span> <span class="n">cv</span><span class="o">::</span><span class="n">moments</span><span class="p">(</span><span class="n">currentCell</span><span class="p">,</span> <span class="nb">true</span><span class="p">);</span>
<span class="err">       </span> <span class="kt">int</span> <span class="n">area</span> <span class="o">=</span> <span class="n">m</span><span class="p">.</span><span class="n">m00</span><span class="p">;</span>
<span class="err">       </span> <span class="k">if</span><span class="p">(</span><span class="n">area</span> <span class="o">&gt;</span> <span class="n">currentCell</span><span class="p">.</span><span class="n">rows</span><span class="o">*</span><span class="n">currentCell</span><span class="p">.</span><span class="n">cols</span><span class="o">/</span><span class="mi">5</span><span class="p">)</span>
<span class="err">       </span> <span class="p">{</span>
<span class="err">           </span> <span class="kt">int</span> <span class="n">number</span> <span class="o">=</span> <span class="n">dr</span><span class="o">-&gt;</span><span class="n">classify</span><span class="p">(</span><span class="n">currentCell</span><span class="p">);</span>
<span class="err">           </span> <span class="n">printf</span><span class="p">(</span><span class="s">&quot;%d &quot;</span><span class="p">,</span> <span class="n">number</span><span class="p">);</span>
<span class="err">       </span> <span class="p">}</span>
<span class="err">       </span> <span class="k">else</span>
<span class="err">       </span> <span class="p">{</span>
<span class="err">           </span> <span class="n">printf</span><span class="p">(</span><span class="s">&quot;  &quot;</span><span class="p">);</span>
<span class="err">       </span> <span class="p">}</span>
</pre></div>


<p>And finally, we end the loops: </p>
<div class="codehilite"><pre><span class="err">   </span> <span class="p">}</span>
<span class="err">   </span> <span class="n">printf</span><span class="p">(</span><span class="s">&quot; &quot;</span><span class="p">);</span>
<span class="p">}</span>
</pre></div>


<p>Try running the program. You should see the SuDoKu printed on the console. </p>
<h2>Accuracy</h2>
<p>Well. the recognition isn''t very accurate. I can think of two main factors: </p>
<ul>
<li>The training data is for handwritten text</li>
<li>The algorithm used isn''t great</li>
</ul>
<p>Other possible things you can use for recognizing the text are neural networks, haar networks or some chain-codes thing (the text on the SuDoKu grid has proper and well defined boundaries). </p>
<h2>Summary</h2>
<p>Today, we loaded the DigitRecognizer class into the main program and made it recognize digits. And with that, the series comes to an end! Hope you''ve learned a lot over the course of this series.</p>','/static/img/tut/post-sudoku.jpg','2010-08-25',1,3,'sudoku-grabber-with-opencv-recognizing-digits');
INSERT INTO "aishack_tutorial" VALUES('Interesting windows in the Harris Corner Detector','The \"score\" calculated for each pixel in the Harris Corner Detector is based on the two eigenvalues of a matrix. The expression to calculate it is not arbitrary, but based on observations of how the expression varies with different eigenvalues. Here''s a graphical explanation of how its done.',32,'<p>The "score" calculated for each pixel in the <a href="/tutorials/harris-corner-detector/">Harris Corner Detector</a> is based on the two eigenvalues of a matrix. The expression to calculate it is not arbitrary, but based on observations of how the expression varies with different eigenvalues. Here''s a graphical explanation of how its done. </p>
<h2>The key idea</h2>
<p>The main idea is to implement the "selection" of corner pixels. This is done using the following score expression:</p>
<figure><img alt="" src="/static/img/tut/harris-equation8.jpg" /><figcaption>
<p>The equations</p>
</figcaption>
</figure>
<p>We need to decide which values of R qualify a pixel as a corner. Here''s another figure:</p>
<figure><img alt="" src="/static/img/tut/score-isoresponse-contours.jpg" /><figcaption>
<p>Visualization of the equations</p>
</figcaption>
</figure>
<p>I''ve taken this figure directly from the original paper that describes the Harris Corner Detector (A combined corner and edge detector, Harris and Stephens, 1988). Here, <em>alpha _and _beta</em> are the two eigenvalues. </p>
<ul>
<li>Both eigenvalues are small, then the pixel is "flat" (the white region)</li>
<li>One eigenvalue is large, and the other is small, then the pixel is an edge (the gray region)</li>
<li>Both eigenvalues are large, then the pixel is a corner (the crossed region)</li>
</ul>
<p>The figure also show contours for the score function. On selecting a proper value, you get positive values in the corner region, and negative values everywhere else.</p>
<p>And thus, the expression for calculating score for each pixel was created! </p>
<h2>Improvements!</h2>
<p>Later on, in 1994, Shi and Tomasi came up with a better corner detection scheme. Their work involved only minor changes in the Harris Corner Detector, but were able to produce better results in corner detection.</p>
<p>In fact, OpenCV implements the Shi and Tomasi corner detector.</p>','/static/img/tut/post-interesting-features.jpg','2010-04-29',1,2,'interesting-windows-in-the-harris-corner-detector');
INSERT INTO "aishack_tutorial" VALUES('Harris Corner Detector','',33,'<p>The Harris Corner Detector is a mathematical operator that finds features (<a href="/tutorials/features-what-are-they/">what are features?</a>) in an image. It is simple to compute, and is fast enough to work on computers. Also, it is popular because it is rotation, scale and illumination variation independent. However, the Shi-Tomasi corner detector, the one implemented in OpenCV, is an improvement of this corner detector.</p>
<h2>The mathematics</h2>
<p>To define the Harris corner detector, we have to go into a bit of math. We''ll get into a bit of calculus, some matrix math, but trust me, it won''t be tough. I''ll make everything easy to understand!</p>
<p>Our aim is to find little patches of image (or "windows") that generate a large variation when moved around. Have a look at this image:</p>
<figure><img alt="" src="/static/img/tut/harris-low-variation.jpg" /><figcaption>
<p>Marked areas have a lot variation</p>
</figcaption>
</figure>
<p>The red square is the window we''ve chosen. Moving it around doesn''t show much of variation. That is, the difference between the window, and the original image below it is very low. So you can''t really tell if the window "belongs" to that position.</p>
<p>Of course, if you move the window too much, like onto the reddish region, you''re bound to see a big difference. But we''ve moved the window too much. Not good.</p>
<p>Now have a look at this:</p>
<figure><img alt="" src="/static/img/tut/harris-high-variation.jpg" /><figcaption>
<p>Regions with extremely high variation</p>
</figcaption>
</figure>
<p>See? Even the little movement of the window produces a noticeable difference. This is the kind of window we''re looking for. Here''s how it translates mathematically:</p>
<figure><img alt="" src="/static/img/tut/harris-equation1.jpg" /><figcaption>
<p>The equation</p>
</figcaption>
</figure>
<ul>
<li>E is the difference between the original and the moved window.</li>
<li>u is the window''s displacement in the x direction</li>
<li>v is the window''s displacement in the y direction</li>
<li>w(x, y) is the window at position (x, y). This acts like a mask. Ensuring that only the desired window is used.</li>
<li>I is the intensity of the image at a position (x, y)</li>
<li>I(x+u, y+v) is the intensity of the moved window</li>
<li>I(x, y) is the intensity of the original</li>
</ul>
<p>We''ve looking for windows that produce a large E value. To do that, we need to high values of the terms inside the square brackets.</p>
<p>(<strong>Note</strong>: There''s a little error in these equations. Can you figure it out? Answer below!)</p>
<p>So, we maximize this term:</p>
<p><img alt="" src="/static/img/tut/harris-equation2.jpg" /></p>
<p>Then, we expand this term using the Taylor series. Whats that? It''s just a way of rewriting this term in using its derivatives.</p>
<p><img alt="" src="/static/img/tut/harris-equation3.jpg" /></p>
<p>See how the I(x+u, y+v) changed into a totally different form ( I(x,y)+uI<sub>x</sub> + vI<sub>y</sub> )? Thats the Taylor series in action. And because the Taylor series is infinite, we''ve ignored all terms after the first three. It gives a pretty good approximation. But it isn''t the actual value.</p>
<p>Next, we expand the square. The I(x,y) cancels out, so its just two terms we need to square. It looks like this:</p>
<p><img alt="" src="/static/img/tut/harris-equation4.jpg" /></p>
<p>Now this messy equation can be tucked up into a neat little matrix form like this:</p>
<p><img alt="" src="/static/img/tut/harris-equation5.jpg" /></p>
<p>See how the entire equation gets converted into a neat little matrix!</p>
<p>(The error: There''s no w(x, y) in these errors :P )</p>
<p>Now, we rename the summed-matrix, and put it to be M:</p>
<p><img alt="" src="/static/img/tut/harris-equation6.jpg" />So the equation now becomes:</p>
<p><img alt="" src="/static/img/tut/harris-equation7.jpg" /></p>
<p>Looks so neat after all the clutter we did above.</p>
<h2>Interesting windows</h2>
<p>It was figured out that eigenvalues of the matrix can help determine the suitability of a window. A score, R, is calculated for each window:</p>
<p><img alt="" src="/static/img/tut/harris-equation8.jpg" /></p>
<p>All windows that have a score R greater than a certain value are corners. They are good tracking points.</p>
<h2>Summary</h2>
<p>The Harris Corner Detector is just a mathematical way of determining which windows produce large variations when moved in any direction. With each window, a score R is associated. Based on this score, you can figure out which ones are corners and which ones are not.</p>
<p>OpenCV implements an improved version of this corner detector. It is called the Shi-Tomasi corner detector.</p>','/static/img/tut/post-interesting-features.jpg','2010-04-26',1,2,'harris-corner-detector');
INSERT INTO "aishack_tutorial" VALUES('The Shi-Tomasi Corner Detector','',34,'<p>The Shi-Tomasi corner detector is based entirely on the <a href="/tutorials/harris-corner-detector/">Harris corner detector</a>. However, one slight variation in a "selection criteria" made this detector much better than the original. It works quite well where even the Harris corner detector fails. So here''s the minor change that Shi and Tomasi did to the original Harris corner detector. </p>
<h2>The change</h2>
<p>The Harris corner detector has a corner selection criteria. A score is calculated for each pixel, and if the score is above a certain value, the pixel is marked as a corner. The score is calculated using two eigenvalues. That is, you gave the two eigenvalues to a function. The function manipulates them, and gave back a score.</p>
<p>You can read more about how <a href="/tutorials/interesting-windows-in-the-harris-corner-detector/">interesting windows in the Harris corner detector</a> are selected.</p>
<p>Shi and Tomasi suggested that the function should be done away with. Only the eigenvalues should be used to check if the pixel was a corner or not.</p>
<p>The score for <strong>Harris </strong>corner detector was calculated like this (R is the score):</p>
<p><img alt="" src="/static/img/tut/harris-equation8.jpg" /></p>
<p>For <strong>Shi-Tomasi</strong>, it''s calculated like this: 
<img alt="" src="/static/img/tut/shi-tomasi-score.jpg" /></p>
<p>In their paper, Shi and Tomasi demonstrated experimentally that this score criteria was much better. If R is greater than a certain predefined value, it can be marked as a corner. Thus, the effect region for a point to be a corner is something like this:</p>
<p><img alt="" src="/static/img/tut/shi-tomasi-region1.jpg" /></p>
<ul>
<li>Green: both λ<sub>1</sub> and λ<sub>2</sub> are greater than a certain value. Thus, this region is for pixels "accepted" as corners.</li>
<li>In the blue and gray regions, either λ<sub>1</sub> or λ<sub>2</sub> is less than he required minimum.</li>
<li>In the red region, both λ<sub>1</sub> and λ<sub>2</sub> are less than the required minimum.
Compare the above with <a href="/tutorials/interesting-windows-in-the-harris-corner-detector/">a similar graph for Harris corner detector</a>... You''ll see the blue and gray areas are equivalent to the "edge" areas. The red region is for "flat" areas. The green is for corners. </li>
</ul>
<h2>Summary</h2>
<p>The Shi-Tomasi corner detector is a complete ripoff of the Harris corner detector, except for a minor change they did :P However, it is much better than the original corner detector, so people use it a lot more. Also, OpenCV implements the Shi-Tomasi corner detection algorithm.</p>','/static/img/tut/post-interesting-features.jpg','2010-05-02',1,2,'the-shitomasi-corner-detector');
INSERT INTO "aishack_tutorial" VALUES('Corner Detection in OpenCV','',35,'<p>OpenCV comes with both the Harris corner detector and the Shi-Tomasi corner detector. However, OpenCV uses the Shi-Tomasi corner detector unless you explicitly specify you want to use the other one. You can also get raw eigenvalues and eigenvectors for each pixel if you want, and process the values yourself. For now, we''ll discuss the predefined functions. </p>
<h2>Good features to track</h2>
<p>That''s the name of the function! It''s parameters look something like this: </p>
<div class="codehilite"><pre><span class="kt">void</span> <span class="nf">cvGoodFeaturesToTrack</span><span class="p">(</span><span class="k">const</span> <span class="n">CvArr</span><span class="o">*</span> <span class="n">image</span><span class="p">,</span>
                           <span class="n">CvArr</span><span class="o">*</span> <span class="n">eig_image</span><span class="p">,</span>
                           <span class="n">CvArr</span><span class="o">*</span> <span class="n">temp_image</span><span class="p">,</span>
                           <span class="n">CvPoint2D32f</span><span class="o">*</span> <span class="n">corners</span><span class="p">,</span>
                           <span class="kt">int</span><span class="o">*</span> <span class="n">corner_count</span><span class="p">,</span>
                           <span class="kt">double</span> <span class="n">quality_level</span><span class="p">,</span>
                           <span class="kt">double</span> <span class="n">min_distance</span><span class="p">,</span>
                           <span class="k">const</span> <span class="n">CvArr</span><span class="o">*</span> <span class="n">mask</span><span class="o">=</span><span class="nb">NULL</span><span class="p">,</span>
                           <span class="kt">int</span> <span class="n">block_size</span><span class="o">=</span><span class="mi">3</span><span class="p">,</span>
                           <span class="kt">int</span> <span class="n">use_harris</span><span class="o">=</span><span class="mi">0</span><span class="p">,</span>
                           <span class="kt">double</span> <span class="n">k</span><span class="o">=</span><span class="mf">0.04</span><span class="p">);</span>
</pre></div>


<p>Lots of parameters. We''ll go through each. </p>
<ul>
<li><em>image</em> - Quite basic. This is the image you want to detect corners in. This image must be a grayscale image (8 bit, single channeled) or a 32-bit, single channeled image.</li>
<li><em>eig_image</em> - This is a temporary storage used by the function. Eigenvalues are calculated automatically and stored in this temporary image. This image should be a 32 bit, single channeled image. Also, it should be the same size as <em>image</em>. The data in this image can be useful (each point is the minimal eigenvalue associated with that pixel).</li>
<li><em>temp_image</em> - Another temporary storage that is used by the function. Unlike eig_image, this image is of no use after the function is over. It should be a 32 bit, single channeled image, with the same size as <em>image</em>.</li>
<li><em>corners</em> - Send a reference to a <em>CvPoint2D32f</em> array here. The function puts all "accepted" <a href="/tutorials/features-what-are-they/">features</a> into this array.</li>
<li><em>corner_count</em> - Send a reference to an integer here. You should set this integer to the maximum number of elements in the corners array before calling the function. After the function is over, it''s value is set to the actual number of points in the array.</li>
<li><em>quality_level</em> - If you check <a href="/tutorials/the-shi-tomasi-corner-detector/">the Shi-Tomasi criteria for selecting features</a>, you''ll see that it requires that the minimum eigenvalue should be above a certain predetermined value. <em>quality_level</em> is used to calculate this value. The threshold is calculated like this: λ<sub>min</sub>=quality_level * λ<sub>max</sub> Here λ<sub>min</sub> is the threshold, and λ<sub>max</sub> is the maximum eigenvalue through the image. Normal values for <em>quality_level</em> should be 0.01 or 0.1 (but always less than 1).</li>
<li><em>min_distance</em> - The minimum distance between two features. If two features or corners are closer than this distance, the function removes the weaker corner.</li>
<li><em>mask</em> - Again, quite basic. The function processes a pixel only if it is non-zero in the mask.</li>
<li><em>block_size </em>- It is better to consider a small region instead of a single point. This parameter lets you set the size of the window around a pixel.</li>
<li><em>use_harris </em>- (optional, default=0) Set this to a non-zero value if you want to use the <a href="/tutorials/harris-corner-detector/">Harris corner detector</a>.</li>
<li><em>k </em>- (optional, default=0.04) If you decide to use the Harris method, you need to supply a ''k'' to calculate a score for each pixel (check <a href="/tutorials/interesting-windows-in-the-harris-corner-detector/">how a score is calculated in the Harris method</a>)</li>
</ul>
<h2>Summary</h2>
<p>The cvGoodFeaturesToTrack function lets you find corners easily. By default, the function uses the Shi-Tomasi method, but you can use the Harris method as well.</p>','/static/img/tut/post-interesting-features.jpg','2010-05-05',1,2,'corner-detection-in-opencv');
INSERT INTO "aishack_tutorial" VALUES('The Hough Transform: Basics','',36,'<p>The Hough transform is an incredible tool that lets you identify lines. Not just lines, but other shapes as well. In this article, I''ll talk about the mechanics behind the Hough transform. It will involve a bit of math, but just elementary concepts you learned in school. In this article, we''ll work with lines only, though the technique can be easily extended to other shapes. </p>
<h2>Why the Hough Transform?</h2>
<p>Lets say you take the snapshot of pole. You figure out edge pixels (using the Canny edge detector, the Sobel edge detector, or any other thing). Now you want a geometrical representation of the pole''s edge.You want to know its slope, its intercept, etc. But right now the "edge" is just a sequence of pixels.</p>
<p>You can loop through all pixels, and some how figure out the slope and intercept. But that is one difficult task. Images are never perfect. </p>
<p>So you want some mechanism that give more weightage to pixels that are already in a line. This is exactly what the Hough Transform does.</p>
<p>It lets each point on the image "vote". And because of the mathematical properties of the transform, this "voting" allows us to figure out prominent lines in the image. </p>
<h2>From lines to points</h2>
<p>A lines is a collection of points. And managing a collection of points is tougher than managing a single point. Obviously. So the first thing we learn is how to represent a line as a single point, without losing any information about it.</p>
<p>This is done through the <strong>m-c space</strong>. </p>
<figure><img alt="" src="/static/img/tut/hough_mc_space.jpg" /><figcaption>
<p>The m-c space</p>
</figcaption>
</figure>
<p>As shown in the above picture, every line has two quantities associated with it, the slope and the intercept. With these two numbers, you can describe a line completely.</p>
<p>So the parameter space, or the mc space was devised. Every line in the xy space is equivalent to a single point in the mc space. Neat eh?</p>
<h2>From points to lines</h2>
<p>Now onto the next step. Consider a point (say, (x<sub>a</sub>, y<sub>a</sub>) )in the xy space. What would its representation in the mc space be?</p>
<p>For starters, you could guess that infinite lines pass through a point. So, for every line passing through (x<sub>a</sub>, y<sub>a</sub>), there would be a point in the mc space.</p>
<p>And you''re correct there, because of the following: </p>
<ol>
<li>Any line passing through (x<sub>a</sub>, y<sub>a</sub>): y<sub>a</sub> = mx<sub>a</sub> + c</li>
<li>Rearranging: c = - x<sub>a</sub>m + y<sub>a</sub></li>
<li>The above is the equation of a line in the mc space.</li>
</ol>
<p>So, a point in the xy space is equivalent to a line in the mc space. </p>
<p><img alt="" src="/static/img/tut/hough_mc_space_point1.jpg" /></p>
<h2>How does this help us?</h2>
<p>The Hough transform is all about doing what we just learned: converting points in the xy space to lines in the mc space.</p>
<p>You taken an edge detected image, and for every point that is non black, you draw lines in the mc place. Obviously, some lines will intersect. These intersections mark are the parameters of the line. </p>
<p>The following picture will clarify the idea:</p>
<figure><img alt="" src="/static/img/tut/hough_lines_example.jpg" /><figcaption>
<p>An example of houghlines</p>
</figcaption>
</figure>
<p>The points 1, 2, 3, and 4 are represented as various lines in the mc space. And the intersection of these lines is equivalent to the original line. </p>
<h2>Great!</h2>
<p>Now you know the basic idea of how the Hough transform works. But there''s one big flaw in the We''ll discuss how to resolve this issue in the next article. </p>','/static/img/tut/post-hough-transform.jpg','2010-03-06',1,2,'the-hough-transform-basics');
INSERT INTO "aishack_tutorial" VALUES('The Hough Transform: Normal form','',37,'<h2>The flaw</h2>
<p>The Hough transform described in <a href="/tutorials/the-hough-transform/">the previous article</a> has an obvious flaw. The value of m (slope) tends to infinity for vertical lines. So you need infinite memory to be able to store the mc space. Not good. </p>
<h2>The solution</h2>
<p>The problem is resolved by using a different parametrization. instead of the slope-intercept form of lines, we use the normal form.</p>
<figure><img alt="" src="/static/img/tut/hough_p0.jpg" /><figcaption>
<p>The normal form</p>
</figcaption>
</figure>
<p>In this representation, a line is formed using two parameters - an angle θ and a distance <em>p</em>. p is the length of the normal from the origin (0, 0) onto the line. and θ is the angle this normal makes with the x axis. This solves the flaw perfectly.</p>
<p>The angle θ can be only from -90<sup>o</sup> to +90<sup>o</sup> and the length p can range from 0 to length of diagonal of the image. These values are finite, and thus you can "store" them on a computer without much trouble. </p>
<p>In this representation, the equation of the line is:</p>
<p><img alt="" src="http://s0.wp.com/latex.php?latex=p%20%3D%20x_1%5Ccos%5Ctheta%20%2B%20y_1%5Csin%5Ctheta&amp;bg=ffffff&amp;fg=000&amp;s=0" /></p>
<p>where <img alt="" src="http://s0.wp.com/latex.php?latex=%28x_1%2C%20y_1%29&amp;bg=ffffff&amp;fg=000&amp;s=0" /> is a point through which the line passes.</p>
<p>With this new equation, we have a few changes in the end-point to line "transition" from the xy space to the pθ space. A line in the xy space is still equivalent to a point in the pθ space. But a point in the xy space is now equivalent to a sinusoidal curve in the pθ space.</p>
<p>The <strong>image at the top </strong>of this article is an actual pθ space. The sinusoidal curves have been generated while trying to figure out lines an image. </p>
<h2>Implementation</h2>
<p>With those ideas through, we''re ready to implement the Hough transform. The idea is to let each pixel "vote". So an array of accumulator cells is created.</p>
<p>In our case, the accumulator cells form a 2D array. The horizontal axis is for the different θ values and the vertical axis for p values. </p>
<figure><img alt="" src="/static/img/tut/hough_p0_accumulator.jpg" /><figcaption>
<p>The accumulator</p>
</figcaption>
</figure>
<p>Next, you loop through every pixel of the edge detected image (Hough works only on edge detected images... not on normal images).</p>
<p>If a pixel is zero, you ignore it. It''s not an edge, so it can''t be a line. So move on to the next pixel.</p>
<p>If a pixel is nonzero, you generate its sinusoidal curve (in the pθ space). That is, you take θ = -90 and calculate the corresponding p value. Then you "vote" in the accumulator cell (θ, p). That is, you increase the value of this cell by 1. Then you take the next θ value and calculate the next p value. And so on till θ = +90. And for every such calculation, making sure they "vote".</p>
<p>So for every nonzero pixel, you''ll get a sinusoidal curve in the pθ space (the accumulator cells). And you''ll end up with an image similar to the one at the top. </p>
<h2>Detecting lines</h2>
<p>The image at the top has several "bright spots". A lot of points "voted" for this spot. And these are the parameters that describe the lines in the original image. Simple as that. </p>
<h2>Accuracy</h2>
<p>The accuracy of the Hough transform depends on the number of accumulator cells you have. Say you have only -90<sup>0</sup>, -45<sup>0</sup>, 0<sup>0</sup>, 45<sup>0</sup> and 90<sup>0</sup> as the cells for θ values. The "voting" process would be terribly inaccurate. Similarly for the p axis. The more cells you have along a particular axis, the more accurate the transform would be.</p>
<p>Also, the technique depends on several "votes" being cast into a small region. Only then would you get those bright spots. Otherwise, differentiating between a line and background noise is one really tough job. </p>
<h2>Done</h2>
<p>Now you know how the standard Hough transform works! You can try implementing it... should be simple enough.</p>','/static/img/tut/post-hough-transform.jpg','2010-03-06',1,2,'the-hough-transform-normal');
INSERT INTO "aishack_tutorial" VALUES('Hough transform in OpenCV','',38,'<p>OpenCV already comes with a  function to perform hough transforms. It lets you choose between different variants of the transform: <a href="/tutorials/the-hough-transform-basics/">the standard hough transform</a>, the probabilistic hough transform and the multi-scale hough transform. Here I''ll get into the technical details of getting the command, <code>cvHoughLines2</code>, to work. The command expects and returns parameters in a certain format. </p>
<h2>The command</h2>
<p>The cvHoughLines2 command goes like this: </p>
<div class="codehilite"><pre><span class="n">CvSeq</span><span class="o">*</span> <span class="nf">cvHoughLines2</span><span class="p">(</span><span class="n">CvArr</span><span class="o">*</span> <span class="n">image</span><span class="p">,</span> <span class="kt">void</span><span class="o">*</span> <span class="n">line_storage</span><span class="p">,</span> <span class="kt">int</span> <span class="n">method</span><span class="p">,</span> <span class="kt">double</span> <span class="n">rho</span><span class="p">,</span> <span class="kt">double</span> <span class="n">theta</span><span class="p">,</span> <span class="kt">int</span> <span class="n">threshold</span><span class="p">,</span> <span class="kt">double</span> <span class="n">param1</span><span class="o">=</span><span class="mi">0</span><span class="p">,</span> <span class="kt">double</span> <span class="n">param2</span><span class="o">=</span><span class="mi">0</span><span class="p">);</span>
</pre></div>


<p>We''ll go into each parameter in detail.</p>
<p><em>image</em> is the image you want to do the hough transform on. This has to be an 8-bit single channel binary image. Though you can supply a grayscale image, it will be treated as a binary image (non-zero pixels are used).</p>
<p><em>line_storage</em> is the place where this function stores its result. This can be either a <em>CvMemoryStorage</em> structure or a matrix with N rows. More on this parameter later.</p>
<p><em>method</em> is either CV_HOUGH_STANDARD, CV_HOUGH_PROBABILISTIC, or CV_HOUGH_MULTI_SCALE. And you can guess they''re for the standard hough transform, the probabilistic hough transform and the multi-scale hough transform.</p>
<p><em>rho</em> and <em>theta</em> set the desired accuracy of the transform. <em>rho</em> is in pixels and <em>theta</em> is in radians. The smaller the value, the better the transform will be... but it''ll also take more time. Usually, values 1 and 0.01 should be sufficient.</p>
<p><em>threshold</em> determines which lines are returned. Each line has a particular number of "votes". This parameter sets the minimum number of "votes" in order to qualify as a potential line. You might want to read about <a href="/tutorials/the-hough-transform/">The Hough Transform</a> for more information on this.</p>
<p><em>param1</em> and <em>param2</em> are used by the different transforms. </p>
<ul>
<li>For the standard hough transform, these are not used</li>
<li>For the probabilistic hough transform, param1 is the minimum line segment length and param2 is the separation between collinear points to split them into two segments (instead of merging into a single one).</li>
<li>For the multi-scale hough transform, <em>rho/param1</em> and <em>theta/param2</em> is the final resolution of the for refining results.</li>
</ul>
<h2>Extracting results</h2>
<p>Getting results out of this command depends on the <em>line_storage</em> parameter. You have two options: supply a <a href="/tutorials/2d-matrices-with-cvmat-in-opencv/">CVMat matrix</a> or supply a CvMemoryStorage stucture. </p>
<h3>The matrix approach</h3>
<p>This one is straight forward. You give it a matrix, and the function will populate this matrix with its results. For different <em>method</em> values, this matrix must have different formats: </p>
<ul>
<li>Standard Hough transform and multi-scale hough transform: The matrix must be N rows by 1 column, and 2 channeled (<code>CV_32FC2</code>). It stores the p and θ values</li>
<li>Probabilistic hough transform: The matrix must be N rows by 1 column, and 4 channeled (<code>CV_32FC4</code>). It stores the two end points of the line segments ( (x,y) twice).
The function will set the number of rows of the matrix to the number of lines detected. Also, it will return a NULL. </li>
</ul>
<h3>The CvMemoryStorage approach</h3>
<p>If you provide a memory storage, the function will return a CvSeq* sequence. Using this sequence, you can access the various parameter of the detected lines: </p>
<div class="codehilite"><pre><span class="kt">float</span><span class="o">*</span> <span class="n">currentLine</span> <span class="o">=</span> <span class="p">(</span><span class="kt">float</span><span class="o">*</span><span class="p">)</span> <span class="n">cvGetSeqElem</span><span class="p">(</span><span class="n">line_seq</span> <span class="p">,</span> <span class="n">index</span><span class="p">);</span>
</pre></div>


<ul>
<li>For the standard hough transform and the multi-scale hough transform, you can access the p and θ values using <code>currentLine[0]</code> and <code>currentLine[1]</code> (both <em>float</em>)</li>
<li>For the probabilistic hough transform, the returned sequence is a sequence of CvPoint. So you can access the end points of line segments using <code>currentLine[0]</code> and <code>currentLine[1]</code> (both <code>CvPoint</code>)</li>
</ul>
<h2>Done!</h2>
<p>This should be enough to get you started with using the cvHoughLines2 command!</p>','/static/img/tut/post-hough-transform.jpg','2010-04-11',1,3,'hough-transform-in-opencv');
INSERT INTO "aishack_tutorial" VALUES('Hough circles in OpenCV','',39,'<p>OpenCV comes along with an already made function that detects circles using <a href="/tutorials/the-hough-transform-basics/">the hough transform</a>. The <a href="/tutorials/circle-hough-transform/">Circle Hough Transform</a> is a little inefficient at detecting circles, so it uses the gradient method of detecting circles using the hough transform. Anyway, you don''t need to know the details about the internals if you just want to get the command to work. </p>
<h2>The command</h2>
<p>The command has the following syntax: </p>
<div class="codehilite"><pre><span class="n">CvSeq</span><span class="o">*</span> <span class="nf">cvHoughCircles</span><span class="p">(</span><span class="n">CvArr</span><span class="o">*</span> <span class="n">image</span><span class="p">,</span> <span class="kt">void</span><span class="o">*</span> <span class="n">circle_storage</span><span class="p">,</span> <span class="kt">int</span> <span class="n">method</span><span class="p">,</span> <span class="kt">double</span> <span class="n">dp</span><span class="p">,</span> <span class="kt">double</span> <span class="n">min_dist</span><span class="p">,</span> <span class="kt">double</span> <span class="n">param1</span><span class="o">=</span><span class="mi">100</span><span class="p">,</span> <span class="kt">double</span> <span class="n">param2</span><span class="o">=</span><span class="mi">100</span><span class="p">,</span> <span class="kt">int</span> <span class="n">min_radius</span><span class="o">=</span><span class="mi">0</span><span class="p">,</span> <span class="kt">int</span> <span class="n">max_radius</span><span class="o">=</span><span class="mi">0</span><span class="p">);</span>
</pre></div>


<p>The parameters are similar to that of cvHoughLines2 (<a href="/tutorials/hough-transform-in-opencv/">Hough transform for lines in OpenCV</a>). I''ll go through each parameter in detail:</p>
<p><em>image</em> is the 8-bit single channel image you want to search for circles in. Because this function uses the gradient method, it automaticall calls cvSobel internally. So, even if you pass a grayscale image, it will automatically generate a binary using cvSobel (internally). </p>
<p><em>circle_storage</em> is where the function puts its results. You can pass a matrix or a CvMemoryStorage structure here.</p>
<p><em>method</em> is always <code>CV_HOUGH_GRADIENT</code></p>
<p><em>dp</em> lets you set the resolution of the accumulator. <em>dp</em> is a kind of scaling down factor. The greater its value, the lower the resolution of the accumulator. <em>dp</em> must always be more than or equal to 1.</p>
<p><em>min_dist</em> is the minimum distance between circle to be considered different circles.</p>
<p><em>param1</em> is used for the (internally called) canny edge detector. The first parameter of the canny is set to <em>param1</em>, and the second is set to <em>param1/2</em>.</p>
<p><em>param2</em> sets the minimum number of "votes" that an accumulator cell needs to qualify as a possible circle.</p>
<p><em>min_radius</em> and <em>max_radius</em> do exactly what to mean. They set the minimum and maximum radii the function searches for. </p>
<h2>Extracting results</h2>
<p>To get results, you need to supply a <em>circle_storage</em>. It can be either a matrix of a <code>CvMemoryStorage</code> structure. </p>
<h3>CvMat matrix</h3>
<p>This is straightforward. You give it a matrix with N rows and 1 column, and in <code>CV_32FC3</code> format. It''s three channeled to hold the three parameters (x, y and r). In this case, the function returns a NULL.</p>
<h3>CvMemoryStorage memory storage</h3>
<p>Here you supply a <code>CvMemoryStorage</code> structure, and the function returns a <code>CvSeq</code> sequence. You can extract data from thsi sequence like this:</p>
<div class="codehilite"><pre><span class="kt">float</span><span class="o">*</span> <span class="n">circle</span> <span class="o">=</span> <span class="p">(</span><span class="kt">float</span><span class="o">*</span><span class="p">)</span> <span class="n">cvGetSeqElem</span><span class="p">(</span><span class="n">circles</span> <span class="p">,</span> <span class="n">index</span><span class="p">);</span>
</pre></div>


<p>Then, <em>circle[0]</em> is the x coordinate, <em>circle[1]</em> is the y coordinate and <em>circle[2]</em> is the radius of the circle. </p>
<h2>Done!</h2>
<p>This should be enough to get you started with using this function and identifying circles in your images!</p>','/static/img/tut/post-hough-transform-circle.jpg','2010-04-14',1,3,'hough-circles-in-opencv');
INSERT INTO "aishack_tutorial" VALUES('Circle Hough Transform','',40,'<p>Here I''ll tell you how to detect circles (which are quite important in computer vision application) using a technique similar to the standard Hough transform. This article assumes you know how the Hough transform works, or you''ve understood the previous articles in this series (The Hough Transform). </p>
<h2>The parameterization</h2>
<p>A circle can be described completely with three pieces of information: the center (a, b) and the radius. (The center consists of two parts, hence a total of three)</p>
<p>x = a + Rcosθ
y = b + Rsinθ</p>
<p>When the θ varies from 0 to 360, a complete circle of radius R is generated.</p>
<p>So with the Circle Hough Transform, we expect to find triplets of (x, y, R) that are highly probably circles in the image. That is, we want to find three parameters. Thus, the parameter space is 3D... meaning things can get ugly if you don''t tread slowly. Out of memory errors are common even if your programming language uses virtual memory.</p>
<p>So we''ll start simple.</p>
<h2>Assuming R is known</h2>
<p>To begin, we''ll start with the assumption that you''re looking for circles of a particular radius, that is, R is known. The equation of each circle is:</p>
<p>x = a + Rcosθ
y = b + Rsinθ</p>
<p>So, every point in the xy space will be equivalent to a circle in the ab space (R isn''t a parameter, we already know it). This is because on rearranging the equations, we get:</p>
<p>a = x<sub>1</sub> - Rcosθ
b = y<sub>1</sub> - Rsinθ</p>
<p>for a particular point (x<sub>1</sub>, y<sub>1</sub>). And θ sweeps from 0 to 360 degrees.</p>
<p>So, the flow of events is something like this: </p>
<ol>
<li>Load an image</li>
<li>Detect edges and generate a binary image</li>
<li>For every ''edge'' pixel, generate a circle in the ab space</li>
<li>For every point on the circle in the ab space, cast ''votes'' in the accumulator cells</li>
<li>The cells with greater number of votes are the centers</li>
</ol>
<p>Here''s an example:</p>
<p><img alt="" src="/static/img/tut/circles.gif" /></p>
<p>We''d like to find circles in this image. First, detect edges to get an image something like this:</p>
<p><img alt="" src="/static/img/tut/circle_edges.jpg" /></p>
<p>I used a sobel operator to get the images. And finally, for every white pixel in the above image, you create a circle in the ab-space. So, the ab space looks something like this:</p>
<p><img alt="" src="/static/img/tut/hough_circle.jpg" /></p>
<p>The horizontal axis is the ''a'' axis, the vertical axis is the ''b'' axis. The brighter a spot, more the number of votes case at the point. And more votes imply a greater probability of a point being a center.</p>
<p>In the above image, you can see the centers clearly. And these points can be easily extracted. </p>
<p>Here''s a superimposed image that might help you understand the idea even better:</p>
<p><img alt="" src="/static/img/tut/circlehough_explanation.jpg" /></p>
<p>In the above image, three random points were chose. Circles of radius R are drawn around them (the red, blue and green circles). And then, votes are cast at the pixels of these circles. Simple as that.</p>
<p>Note that the technique worked even though the entire circle''s perimeter was not visible. The two circles overlapped, and yet they were detected as separate circles. </p>
<h2>When R is not known</h2>
<p>When the radius is not known, the simplest solution is to just guess. Assume R = 1, and then run the same algorithm. Then assume R = 2, and run it again. Assume R = 3.... and so on.</p>
<p>Whats the upper limit of R? A safe limit would be the length of the diagonal of the image. No possible circle on the image can have a radius greater than or equal to the diagonal. </p>
<p><img alt="" src="/static/img/tut/cht_offlimit_circle.jpg" /></p>
<p>So, you''ll end up with a 3D parameter space. Each horizontal plane would be equivalent to a 2D parameter space where R is known. </p>
<p>Also, you''ll end up with a <strong>double cone </strong>around the centers. Here''s an example. This of this like a CAT scan... going through the different slices of ab planes:</p>
<p>[flv:/static/img/tut/hough_circle.flv 320 240] </p>
<h2>Some issues</h2>
<h3>Accuracy</h3>
<p>The accuracy depends on the number of accumulator cells you have. If you have cells for 0, 0.01, 0.02, 0.03, and so on, you''ll get better results than 0, 1, 2, 3. But at the same time, the amount of memory required increases. </p>
<h3>Spurious circles</h3>
<p>Sometimes, spurious circles are detected. This can happen if the image has a lot of circles. Close to each other. This problem can be overcome by just checking if a circle actually exists at the highest voted centers.</p>','/static/img/tut/post-hough-transform-circle.jpg','2010-03-12',1,2,'circle-hough-transform');
INSERT INTO "aishack_tutorial" VALUES('An introduction to contours','',41,'<h2>Introduction</h2>
<p>In this tutorial, you''ll get to know how to use contours. You can think of contours as a boundary. Consider the following thresholded image:</p>
<figure><img alt="A thresholded image" src="/static/img/tut/thresholding_thresholded.jpg" /><figcaption>
<p>A thresholded image</p>
</figcaption>
</figure>
<p>Using contours, the computer can create a list of points for each "patch" or "blob" of white in the above image. Then you can do whatever you want with these points... figure out the center of the patch, or calculate its approximate size... etc. </p>
<h2>The project</h2>
<p>In this tutorial, we''ll try and detect all quadrilaterals (polygons with 4 sides) in a thresholded image. We use a thresholded image because it has a clear differentiation: it''s either black or white. And this really helps in generating accurate contours. You can go through the thresholding tutorial to learn about that.</p>
<p>Start off by creating a new C++ Win32 console application. Choose any name you want and click OK. Accept the defaults and click Finish. </p>
<p>Goto the Project &gt; Properties &gt; Configuration Properties &gt; Linker &gt; Input, and put the following piece of text in the Additional Dependencies: "cv.lib cvaux.lib cxcore.lib highgui.lib", without the quotes of course. Now we''re ready to use OpenCV.</p>
<p>With that done, we''ll dive straight into the code... starting with the headers. Add these lines: </p>
<div class="codehilite"><pre><span class="cp">#include &lt;cv.h&gt;</span>
<span class="cp">#include &lt;highgui.h&gt;</span>
</pre></div>


<p>And then add these lines to the main function: </p>
<div class="codehilite"><pre><span class="kt">int</span> <span class="nf">main</span><span class="p">()</span>
<span class="p">{</span>
<span class="err"> </span> <span class="err"> </span><span class="n">IplImage</span><span class="o">*</span> <span class="n">img</span> <span class="o">=</span> <span class="n">cvLoadImage</span><span class="p">(</span><span class="s">&quot;C:</span><span class="se">\\\\</span><span class="s">thresholded.jpg&quot;</span><span class="p">);</span>
<span class="err"> </span> <span class="err"> </span><span class="n">IplImage</span><span class="o">*</span> <span class="n">contourDrawn</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span>
<span class="err"> </span> <span class="err"> </span><span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;original&quot;</span><span class="p">);</span>
<span class="err"> </span> <span class="err"> </span><span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;original&quot;</span><span class="p">,</span> <span class="n">img</span><span class="p">);</span>
</pre></div>


<p>We load a thresholded image from disk into img. Note the 0... that indicates that the image we''re loading is already grayscale. Then we create a pointer to an image, called countourDrawn. And then we create a new window titled "original" and display the original image in it.</p>
<p>Then add these line: </p>
<div class="codehilite"><pre>  <span class="err"> </span> <span class="n">contourDrawn</span> <span class="o">=</span> <span class="n">DetectAndDrawQuads</span><span class="p">(</span><span class="n">img</span><span class="p">);</span>
<span class="err"> </span> <span class="err"> </span> <span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;contours&quot;</span><span class="p">);</span>

<span class="err"> </span> <span class="err"> </span> <span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;contours&quot;</span><span class="p">,</span> <span class="n">contourDrawn</span><span class="p">);</span>

<span class="err"> </span> <span class="err"> </span> <span class="n">cvWaitKey</span><span class="p">(</span><span class="mi">0</span><span class="p">);</span>
<span class="err"> </span> <span class="err"> </span> <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>

<span class="p">}</span>
</pre></div>


<p>We''ll work on the DetectAndDrawQuads function in a few moments. It just takes an image... and finds all possible quads in it, and returns a new image (which as all the contours drawn in it). This image is stored in contourDrawn. And then it is displayed in a window called "contours". And then you wait till eternity for a key press :)</p>
<p>Now lets get to the juice of the tutorial... actually detecting the presence of quads. Once you''re through this, you''ll be able to detect the presence of complex shapes as well... like circles, squares, even something as complex as a star.</p>
<p>Go above the main function and add these lines: </p>
<div class="codehilite"><pre><span class="n">IplImage</span><span class="o">*</span> <span class="nf">DetectAndDrawQuads</span><span class="p">(</span><span class="n">IplImage</span><span class="o">*</span> <span class="n">img</span><span class="p">)</span>
<span class="p">{</span>
<span class="err"> </span> <span class="err"> </span> <span class="n">CvSeq</span><span class="o">*</span> <span class="n">contours</span><span class="p">;</span>
<span class="err"> </span> <span class="err"> </span> <span class="n">CvSeq</span><span class="o">*</span> <span class="n">result</span><span class="p">;</span>
<span class="err"> </span> <span class="err"> </span> <span class="n">CvMemStorage</span> <span class="o">*</span><span class="n">storage</span> <span class="o">=</span> <span class="n">cvCreateMemStorage</span><span class="p">(</span><span class="mi">0</span><span class="p">);</span>
</pre></div>


<p>This function returns an image... also takes an image as a parameter. Inside it, we first create some sequences (a sequence is roughly equal to a linked list): one for holding the various contours we''ll get. The other is for temporarily holding the points of a contour as we go through each contour. Then we create some actual storage area... for storing the contours.</p>
<p>Then, add these lines: </p>
<div class="codehilite"><pre>    <span class="n">IplImage</span><span class="o">*</span> <span class="n">ret</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvGetSize</span><span class="p">(</span><span class="n">img</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">3</span><span class="p">);</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">temp</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvGetSize</span><span class="p">(</span><span class="n">img</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>
</pre></div>


<p>Then we create a blank image (of the same size as img) with 3 channels (rgb). We''ll be drawing on this image. We also create a single channeled temporary image. Finding contours works only on grayscale images (with one channel). So to preserve the original image passed to us, we create a new image which is grayscale. To actually convert the image into grayscale, we use the following command: </p>
<div class="codehilite"><pre>    <span class="n">cvCvtColor</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="n">temp</span><span class="p">,</span> <span class="n">CV_BGR2GRAY</span><span class="p">);</span>
</pre></div>


<p>This convert img from a BGR format into a grayscale image and stores it into temp. Now, add this line: </p>
<div class="codehilite"><pre>    <span class="n">cvFindContours</span><span class="p">(</span><span class="n">temp</span><span class="p">,</span> <span class="n">storage</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">contours</span><span class="p">,</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">CvContour</span><span class="p">),</span> <span class="n">CV_RETR_LIST</span><span class="p">,</span> <span class="n">CV_CHAIN_APPROX_SIMPLE</span><span class="p">,</span> <span class="n">cvPoint</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">));</span>
</pre></div>


<p>This line actually detects all the contours on the grayscale image img and stores them in contours.</p>
<p>Next we loop through all the contours discovered.. and try to figure out which one is a quad: </p>
<div class="codehilite"><pre>    <span class="k">while</span><span class="p">(</span><span class="n">contours</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="n">result</span> <span class="o">=</span> <span class="n">cvApproxPoly</span><span class="p">(</span><span class="n">contours</span><span class="p">,</span> <span class="k">sizeof</span><span class="p">(</span><span class="n">CvContour</span><span class="p">),</span> <span class="n">storage</span><span class="p">,</span> <span class="n">CV_POLY_APPROX_DP</span><span class="p">,</span> <span class="n">cvContourPerimeter</span><span class="p">(</span><span class="n">contours</span><span class="p">)</span><span class="o">*</span><span class="mf">0.02</span><span class="p">,</span> <span class="mi">0</span><span class="p">);</span>
</pre></div>


<p>result now stores actual points from the image that lie on the contour. Now, the most simple logic for detecting a quad would be: if a contour has 4 points, it has a quad. As simple as that. And we implement that using the following code: </p>
<div class="codehilite"><pre>        <span class="k">if</span><span class="p">(</span><span class="n">result</span><span class="o">-&gt;</span><span class="n">total</span><span class="o">==</span><span class="mi">4</span><span class="p">)</span>
        <span class="p">{</span>
            <span class="n">CvPoint</span> <span class="o">*</span><span class="n">pt</span><span class="p">[</span><span class="mi">4</span><span class="p">];</span>
            <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">i</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">i</span><span class="o">&lt;</span><span class="mi">4</span><span class="p">;</span><span class="n">i</span><span class="o">++</span><span class="p">)</span>

                <span class="n">pt</span><span class="p">[</span><span class="n">i</span><span class="p">]</span> <span class="o">=</span> <span class="p">(</span><span class="n">CvPoint</span><span class="o">*</span><span class="p">)</span><span class="n">cvGetSeqElem</span><span class="p">(</span><span class="n">result</span><span class="p">,</span> <span class="n">i</span><span class="p">);</span>

            <span class="n">cvLine</span><span class="p">(</span><span class="n">ret</span><span class="p">,</span> <span class="o">*</span><span class="n">pt</span><span class="p">[</span><span class="mi">0</span><span class="p">],</span> <span class="o">*</span><span class="n">pt</span><span class="p">[</span><span class="mi">1</span><span class="p">],</span> <span class="n">cvScalar</span><span class="p">(</span><span class="mi">255</span><span class="p">));</span>
            <span class="n">cvLine</span><span class="p">(</span><span class="n">ret</span><span class="p">,</span> <span class="o">*</span><span class="n">pt</span><span class="p">[</span><span class="mi">1</span><span class="p">],</span> <span class="o">*</span><span class="n">pt</span><span class="p">[</span><span class="mi">2</span><span class="p">],</span> <span class="n">cvScalar</span><span class="p">(</span><span class="mi">255</span><span class="p">));</span>
            <span class="n">cvLine</span><span class="p">(</span><span class="n">ret</span><span class="p">,</span> <span class="o">*</span><span class="n">pt</span><span class="p">[</span><span class="mi">2</span><span class="p">],</span> <span class="o">*</span><span class="n">pt</span><span class="p">[</span><span class="mi">3</span><span class="p">],</span> <span class="n">cvScalar</span><span class="p">(</span><span class="mi">255</span><span class="p">));</span>
            <span class="n">cvLine</span><span class="p">(</span><span class="n">ret</span><span class="p">,</span> <span class="o">*</span><span class="n">pt</span><span class="p">[</span><span class="mi">3</span><span class="p">],</span> <span class="o">*</span><span class="n">pt</span><span class="p">[</span><span class="mi">0</span><span class="p">],</span> <span class="n">cvScalar</span><span class="p">(</span><span class="mi">255</span><span class="p">));</span>
        <span class="p">}</span>
</pre></div>


<p>If the number of points on a contour is 4... we take it to be a quadrilateral. Then, we get each point from result and store them into an array of points (pt[]). And then we draw the quadrilateral (joining each of the points... from 0 to 1, from 1 to 2, and so on).</p>
<p>To finish off this function, add these line: </p>
<div class="codehilite"><pre>        <span class="n">contours</span> <span class="o">=</span> <span class="n">contours</span><span class="o">-&gt;</span><span class="n">h_next</span><span class="p">;</span>

    <span class="p">}</span>

    <span class="n">cvReleaseImage</span><span class="p">(</span><span class="o">&amp;</span><span class="n">temp</span><span class="p">);</span>

    <span class="n">cvReleaseMemStorage</span><span class="p">(</span><span class="o">&amp;</span><span class="n">storage</span><span class="p">);</span>

    <span class="k">return</span> <span class="n">ret</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>We go on to the next contour. And the loop continues until all contours are checked. Once that is done, the temporary image is released.. and also the storage for contours. Note that we don''t release img... it was given to us... so we assume that the function which passed it, will manage release it... we don''t need to bother about that.</p>
<p>Finally, we return the image we''ve drawn. </p>
<p>At this point, try executing the program. You''ll get some output like this:</p>
<figure><img alt="Detection!" src="/static/img/tut/detect_nosize.jpg" /><figcaption>
<p>Detection</p>
</figcaption>
</figure>
<p>Satisfactory results. Our program is somewhat able to recognize the presense of squares, and then draw an image. Notice the small quads? They aren''t really quads...but the "jaggy" edges turn into quads. To eliminate some of this "noise", we can set a minimum limit on a contour to be considered a quad... say 20 pixels... so if a contour has more than 20 pixels inside it, it would be considered a quad... otherwise it would be taken as noise and would be ignored (no drawn).</p>
<p>To do this, you''d need to modify the if... change it to this line: </p>
<div class="codehilite"><pre><span class="k">if</span><span class="p">(</span><span class="n">result</span><span class="o">-&gt;</span><span class="n">total</span><span class="o">==</span><span class="mi">4</span> <span class="o">&amp;&amp;</span> <span class="n">fabs</span><span class="p">(</span><span class="n">cvContourArea</span><span class="p">(</span><span class="n">result</span><span class="p">,</span> <span class="n">CV_WHOLE_SEQ</span><span class="p">))</span> <span class="o">&gt;</span> <span class="mi">20</span><span class="p">)</span>
</pre></div>


<p>and you''re done. The cvContourArea calculates the area of a contour, and returns it. If it is less than 20, we simply skip this contour. Note that we did a fabs... a floating number absolute. The area can be negative (this depends on the orientation of the points). So we simply take the magnitude and ignore the sign.</p>
<p>Run this code and you should get better results: </p>
<figure><img alt="Detection with size constraints" src="/static/img/tut/detect_withsize.jpg" /><figcaption>
<p>Detection with size constraints</p>
</figcaption>
</figure>
<p>Another condition used to reduce noise is checking convexity. You can do that using the cvCheckContourConvexity(result) function. If it returns a non zero value, the given contour is convex. Otherwise, it is concave.</p>
<figure><img alt="Convex vs Concave polygons" src="/static/img/tut/detect_convexity.jpg" />Convex / concave<figcaption>
<p>Convex vs concave polygons</p>
</figcaption>
</figure>
<h2>Wrap up</h2>
<p>Thats it for now. The program we''ve made isn''t flawless: it doesn''t detect the two small quads. I''ll leave it up to you to find out why and figure out a way to "detect" them (hint: maybe they''re not 4 points).</p>
<p>I hope you learned something from this. And if you have any suggestions or criticisms, do leave a comment!</p>','','2010-01-01',1,3,'an-introduction-to-contours');
INSERT INTO "aishack_tutorial" VALUES('Generating uniform noise','',42,'<h2>Uniform Noise</h2>
<p>Uniform noise means the different "values" of noise are equally probably. Its probability density function looks something like this:</p>
<p><img alt="The Uniform Probability Distribution" src="/static/img/tut/uniform_distribution.gif" /></p>
<p>If you don''t understand what this graph (probability distribution function) means, you might want to have a look at the article on Noise Models. </p>
<h2>Generating uniform random numbers</h2>
<p>Here the plan of action to generate uniform noise: For each pixel in the image, we generate a random number that follows the distribution shown above. Then we simply add the random number to the pixel''s original value. Basically thats what noise is. Corrupting an image.</p>
<p>By default, the random numbers generated by computers are uniform in nature. So we won''t need to put in any effort to generate the random numbers (normal C/C++ functions will do). Its going to be really simple. </p>
<h2>The project</h2>
<p>Begin by creating a Win32 console new project. Name it whatever you want and just accept the default settings. You''ll get an empty project.</p>
<p>In the main cpp file, add the following headers... we''ll be using them: </p>
<div class="codehilite"><pre><span class="cp">#include &lt;cv.h&gt;</span>
<span class="cp">#include &lt;highgui.h&gt;</span>
<span class="cp">#include &lt;math.h&gt;</span>
<span class="cp">#include &lt;float.h&gt;</span>
</pre></div>


<p>We also need to include the OpenCV libraries. Goto Project &gt; Properties &gt; Configuration &gt; Linker &gt; Input and type in cv.lib cxcore.lib highgui.lib cvaux.lib in Additional Dependencies.</p>
<p>Now onto the code. We''ll first add code that generates uniformly distributed random numbers. Since C/C++ functions themselves generate uniform random numbers, we just generate a random number, and simply return it. </p>
<div class="codehilite"><pre><span class="c1">// Returns a uniformly distributed random number</span>
<span class="kt">double</span> <span class="nf">uniform</span><span class="p">()</span>
<span class="p">{</span>
    <span class="k">return</span> <span class="p">(</span><span class="n">rand</span><span class="p">()</span><span class="o">/</span><span class="p">(</span><span class="kt">float</span><span class="p">)</span><span class="mh">0x7fff</span><span class="p">)</span><span class="o">-</span><span class="mf">0.5</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>rand is a standard function that returns a random number betwen 0 and 32767 (0x7FFF). So we convert it into a decimal number between 0.0 and 1.0 and then we convert it into a numebr between -0.5 and +0.5, then we return it.</p>
<p>Now for the actual generation of noise. We start off by writing a function that returns the noisy image: </p>
<div class="codehilite"><pre><span class="n">IplImage</span><span class="o">*</span> <span class="nf">GenerateNoise</span><span class="p">(</span><span class="n">IplImage</span><span class="o">*</span> <span class="n">img</span><span class="p">,</span> <span class="kt">float</span> <span class="n">amount</span><span class="o">=</span><span class="mi">255</span><span class="p">)</span>
<span class="p">{</span>
</pre></div>


<p>We create a copy of the image, just to keep the original safe: </p>
<div class="codehilite"><pre>    <span class="n">CvSize</span> <span class="n">imgSize</span> <span class="o">=</span> <span class="n">cvGetSize</span><span class="p">(</span><span class="n">img</span><span class="p">);</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgTemp</span> <span class="o">=</span> <span class="n">cvCloneImage</span><span class="p">(</span><span class="n">img</span><span class="p">);</span> <span class="c1">// This will hold the noisy image</span>
</pre></div>


<p>And we go through each pixel of the image: </p>
<div class="codehilite"><pre>    <span class="c1">// Go through each pixel</span>
    <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">y</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">y</span><span class="o">&lt;</span><span class="n">imgSize</span><span class="p">.</span><span class="n">height</span><span class="p">;</span><span class="n">y</span><span class="o">++</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">x</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">x</span><span class="o">&lt;</span><span class="n">imgSize</span><span class="p">.</span><span class="n">width</span><span class="p">;</span><span class="n">x</span><span class="o">++</span><span class="p">)</span>
        <span class="p">{</span>
</pre></div>


<p>Now we generate a random number that will be the amount of noise added (or subtracted) to the pixel''s current value: </p>
<div class="codehilite"><pre>            <span class="kt">int</span> <span class="n">randomValue</span> <span class="o">=</span> <span class="p">(</span><span class="kt">char</span><span class="p">)((</span><span class="n">uniform</span><span class="p">())</span><span class="o">*</span><span class="n">amount</span><span class="p">);</span>
</pre></div>


<p>The uniform() function returns a uniformly distributed random number between -0.5 and 0.5 This gets multiplied with the amount (rather, magnitude) of noise you want.</p>
<p>With the number in hand, we "add'' this nosie to the current pixel: </p>
<div class="codehilite"><pre>            <span class="c1">// Here we &quot;apply&quot; the noise to the current pixel</span>

            <span class="kt">int</span> <span class="n">pixelValue</span> <span class="o">=</span> <span class="n">cvGetReal2D</span><span class="p">(</span><span class="n">imgTemp</span><span class="p">,</span> <span class="n">y</span><span class="p">,</span> <span class="n">x</span><span class="p">)</span><span class="o">+</span><span class="n">randomValue</span><span class="p">;</span>

            <span class="c1">// And set this value in our noisy image</span>
            <span class="n">cvSetReal2D</span><span class="p">(</span><span class="n">imgTemp</span><span class="p">,</span> <span class="n">y</span><span class="p">,</span> <span class="n">x</span><span class="p">,</span> <span class="n">pixelValue</span><span class="p">);</span>
</pre></div>


<p>And with the we close both loops, and return the image we''ve created. </p>
<div class="codehilite"><pre>        <span class="p">}</span>
    <span class="p">}</span>
    <span class="c1">// return</span>
    <span class="k">return</span> <span class="n">imgTemp</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>Simple enough, right? </p>
<h2>Applying noise</h2>
<p>Now lets get to the main() function: </p>
<div class="codehilite"><pre><span class="kt">int</span> <span class="nf">main</span><span class="p">()</span>
<span class="p">{</span>
    <span class="c1">// Load the image with no noise</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">img</span> <span class="o">=</span> <span class="n">cvLoadImage</span><span class="p">(</span><span class="s">&quot;noise_tester.jpg&quot;</span><span class="p">,</span> <span class="mi">0</span><span class="p">);</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgTemp</span><span class="p">;</span>
</pre></div>


<p>We simply load an image, img. We''ll be adding noise to this image, which will be stored in imgTemp. Now the img is loaded as a grayscale image.</p>
<p>Next we create a window that will display the noisy image. We''ll also be adding a trackbar so you can experiment with the "amount" parameter. </p>
<div class="codehilite"><pre>    <span class="c1">// Initialize the window systems</span>
    <span class="kt">int</span> <span class="n">trackPos</span> <span class="o">=</span> <span class="mi">20</span><span class="p">;</span>
    <span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;Image&quot;</span><span class="p">);</span>
    <span class="n">cvCreateTrackbar</span><span class="p">(</span><span class="s">&quot;amount&quot;</span><span class="p">,</span> <span class="s">&quot;Image&quot;</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">trackPos</span><span class="p">,</span> <span class="mi">255</span><span class="p">,</span> <span class="nb">NULL</span><span class="p">);</span>
</pre></div>


<p>This creates a window named "Image", and adds a trackbar named "amount" to it. If you''re not sure about trackbars, you might want to go through the article HighGUI: Creating Interfaces.</p>
<p>Next we create a loop that runs till infinity. And inside this loop, we apply noise to image we just loaded, then we display it, and we immediately release it (to avoid enormous memory usage): </p>
<div class="codehilite"><pre>    <span class="k">while</span><span class="p">(</span><span class="nb">true</span><span class="p">)</span>
    <span class="p">{</span>

        <span class="n">imgTemp</span> <span class="o">=</span> <span class="n">GenerateNoise</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="n">trackPos</span><span class="p">);</span>

        <span class="c1">// Display it all</span>
        <span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;Image&quot;</span><span class="p">,</span> <span class="n">imgTemp</span><span class="p">);</span>
        <span class="n">cvReleaseImage</span><span class="p">(</span><span class="o">&amp;</span><span class="n">imgTemp</span><span class="p">);</span>
</pre></div>


<p>We then check for a keypress. If a key is pressed, we need to break out of the loop: </p>
<div class="codehilite"><pre>        <span class="c1">// Check for a key press</span>
        <span class="kt">char</span> <span class="n">keyPress</span> <span class="o">=</span> <span class="n">cvWaitKey</span><span class="p">(</span><span class="mi">10</span><span class="p">);</span>
        <span class="k">if</span><span class="p">(</span><span class="n">keyPress</span><span class="o">!=-</span><span class="mi">1</span><span class="p">)</span> <span class="k">break</span><span class="p">;</span>
    <span class="p">}</span>
</pre></div>


<p>And once we''re out of the loop, we release the original image, and, well, exit. </p>
<div class="codehilite"><pre>    <span class="c1">// Finally, exit</span>
    <span class="n">cvReleaseImage</span><span class="p">(</span><span class="o">&amp;</span><span class="n">img</span><span class="p">);</span>
    <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>And thats all there is to generating uniform noise! </p>
<h2>Wrap up</h2>
<p>Here you learned how to create uniform noise and we create a little interactive demo out of it, where noise is applied to the image in real time and you can alter the amount of noise.</p>
<p>We limited our noise to a grayscale image. To extend this to a coloured image, you take the three channels, and apply noise to each of them independently. And voila, you get a noisy coloured image! </p>
<p>There also exist other types of noises, exponential, rayleigh. You can read up about them here: Noise models.</p>','/static/img/tut/post-noise.jpg','2010-01-07',1,3,'generating-uniform-noise');
INSERT INTO "aishack_tutorial" VALUES('Noise Models (part 2)','',43,'<h2>The Exponential Noise Distribution</h2>
<p>The exponential distribution distribution looks like this:</p>
<figure><img alt="The Exponential Distribution" src="/static/img/tut/exponential_distribution.gif" /><figcaption>
<p>The exponential distribution</p>
</figcaption>
</figure>
<p>Here''s a sample of what exponential noise looks like:</p>
<figure><img alt="No noise applied" src="/static/img/tut/noise_tester.jpg" /><figcaption>
<p>No noise</p>
</figcaption>
</figure>
<figure><img alt="An image with exponential noise applied" src="/static/img/tut/noise_tester_exponential.jpg" /><figcaption>
<p>Exponential noise!</p>
</figcaption>
</figure>
<p>The histograms for the above images are:</p>
<figure><img alt="The original image''s histogram" src="/static/img/tut/noise_tester_no_hist.jpg" /><figcaption>
<p>No noise</p>
</figcaption>
</figure>
<figure><img alt="The exponential noised image''s histogram" src="/static/img/tut/noise_tester_exponential_hist.jpg" /><figcaption>
<p>Exponential noise histogram</p>
</figcaption>
</figure>
<p>Again, you see something similar to the exponential distribution. This is also independent noise and is used to model noise in laser imaging. </p>
<h2>The Rayleigh Noise Distribution</h2>
<p>Here''s the characteristic plot of the Rayleigh probability distribtion function:</p>
<p><img alt="The Rayleigh distribution" src="/static/img/tut/rayleigh_distribution.gif" /> And here''s what rayleigh noise looks like: </p>
<figure><img alt="No noise applied" src="/static/img/tut/noise_tester.jpg" /><figcaption>
<p>No noise!</p>
</figcaption>
</figure>
<figure><img alt="An image with rayleigh noise" src="/static/img/tut/noise_tester_rayleigh.jpg" /><figcaption>
<p>Rayleigh noise</p>
</figcaption>
</figure>
<p>And here''s the histograms for both of the images above: </p>
<figure><img alt="The original image''s histogram" src="/static/img/tut/noise_tester_no_hist.jpg" /><figcaption>
<p>The original histogram</p>
</figcaption>
</figure>
<figure><img alt="The histogram of the &quot;rayleighed&quot; image" src="/static/img/tut/noise_tester_rayleigh_hist.jpg" /><figcaption>
<p>Rayleigh noise</p>
</figcaption>
</figure>
<p>This too is independent noise and is used to characterize noise in range imaging.</p>
<h2>The Uniform Noise Distribution</h2>
<p>Now for something new. Instead of all the curvy graphs till now, the uniform distribution has a flat line. It looks like this:</p>
<figure><img alt="The uniform distribution" src="/static/img/tut/uniform_distribution1.gif" /><figcaption>
<p>The uniform distribution</p>
</figcaption>
</figure>
<p>Here, all the values between a and b have an equal probability of occuring. Hence the flat top. Here''s what uniform noise looks like: </p>
<figure><img alt="No noise applied" src="/static/img/tut/noise_tester.jpg" /><figcaption>
<p>No noise</p>
</figcaption>
</figure>
<figure><img alt="An image with uniform noise applied" src="/static/img/tut/noise_tester_uniform.jpg" /><figcaption>
<p>An image with uniform noise</p>
</figcaption>
</figure>
<p>And, as usual, here are the histograms for them: </p>
<figure><img alt="The original image''s histogram" src="/static/img/tut/noise_tester_no_hist.jpg" /><figcaption>
<p>The original image</p>
</figcaption>
</figure>
<figure><img alt="The uniform noised image''s histogram" src="/static/img/tut/noise_tester_uniform_hist.jpg" /><figcaption>
<p>Uniform noise''d</p>
</figcaption>
</figure>
<p>Looks pretty "uniform" right? This, too, is independent noise. This noise model doesn''t resemble any practical situation. Its there just because computers always generate uniform random numbers. So generating uniform noise isn''t tough. </p>
<h2>The Impulse Noise Distribution: Salt and Pepper Noise</h2>
<p>Here''s something completely new. No probability distribution function here. Have a look at the following images: </p>
<figure><img alt="No noise applied" src="/static/img/tut/noise_tester.jpg" /><figcaption>
<p>No salt/pepper</p>
</figcaption>
</figure>
<figure><img alt="Salt and pepper noise" src="/static/img/tut/noise_tester_salt_pepper_impulse.jpg" /><figcaption>
<p>Salt/pepper</p>
</figcaption>
</figure>
<p>You''d have noticed that this noise looks very different from the ones we''ve seen earlier. You can simply visually distinguish between this noise and the others we''ve discussed so far. </p>
<p>Its called salt and pepper because it looks like that: the white specks are the salt, the black ones are the pepper.</p>
<p>This noise is generally produced when transmitting an image. The value of the pixel just gets corrupted: all bits of the pixel turn into a 1, or into a 0... or the bits invert (1 turns into a 0, and vice versa). </p>
<p>Representing this mathematically is a bit complicated. And generally, this is a Data dependent noise.</p>
<p>Here are the histograms for the two images just shown: </p>
<figure><img alt="The original image''s histogram" src="/static/img/tut/noise_tester_no_hist.jpg" /><figcaption>
<p>Original histogram</p>
</figcaption>
</figure>
<figure><img alt="Salt and pepper''s histogram" src="/static/img/tut/noise_tester_salt_pepper_impulse_hist.jpg" /><figcaption>
<p>The peppered histogram</p>
</figcaption>
</figure>
<p>Notice how the original spikes remain preserved. Only little spikes are added at the very extremities of the histogram. The leftmost little spike being for the "pepper" and the right most being for the "salt". </p>
<h2>Conclusion</h2>
<p>So we discussed 6 unique noise distributions in this article. Now you''re in direct competition with Photoshop... which just offers Gaussian and Uniform noise! Go defeat some photoshop with OpenCV!</p>
<p>And, I''ve created a little program that lets you generate all these noises in realtime. Feel free to download and experiment with it. You can choose between different noise types by pressing the keys 1-6. You can download it from the link below. </p>','/static/img/tut/post-noise.jpg','2010-01-09',1,2,'noise-models-2');
INSERT INTO "aishack_tutorial" VALUES('Noise Models (part 1)','',44,'<h2>Models?! Where?!?!!</h2>
<p>Technically, it is possible to "represent" random noise as a mathematical function. And that is exactly what a model is. The "distribution" of noise is based on probability. Hence the model is called a Probability Density Function (PDF).</p>
<p>Once noise has been quantified, creating filters to get rid of it becomes a lot more easier. In this article, we''ll just be going through the various PDFs (probability density functions) and get acquainted with six different noise models. </p>
<h2>Probability Density Functions (PDF)</h2>
<p>Okay, the name sound scary. Terrifying maybe. But PDFs are simple once you understand their real meaning. Right now, I''ll just try and explain the concept...</p>
<p>Consider the distribution of numbers below (I just made it up in 2 minutes): </p>
<figure><img alt="A random distribution" src="/static/img/tut/random_distribution.gif" /><figcaption>
<p>A random distribution</p>
</figcaption>
</figure>
<p>In this graph, the vectical axis represents probability. And the horizontal axis represents numbers. </p>
<p>Now here''s the thing: The probability a randomly picked number (say x) lies in a range from a to b (a,b) is equal to the area of the curve between a and b.</p>
<p>If you take infinite random numbers, distributed as shown above, then: </p>
<ul>
<li>If you pick a number randomly, then there is a 0% chance that it will be a 49. That''s because the "area" between 49 and 49 is, well, zero.</li>
<li>Similarly, there is a 75% chance that the number will be -73 or 49. Thats because a lot of area under the curve is between -73 and 49.</li>
<li>There is a 100% chance of picking a number between +infinity or -infinity</li>
</ul>
<p>These hold because the PDF satisfies some conditions. You could take an entire course at your university if you want to get into the mathematical details. So I won''t go into the details here.</p>
<p>There are certain mathematical properties of the distribution as well: the mean and the variance. </p>
<figure><img alt="The mean of the random distribution" src="/static/img/tut/random_distribution_mean.gif" /><figcaption>
<p>The mean of the random distribution</p>
</figcaption>
</figure>
<p>The mean is roughly the "middle value" of the entire distribution. In the distribution above, the mean would be slightly shifted to the left (because of its skewed nature). </p>
<p>The variance is a measure of how much the probabilities vary. A greater variance means you''re more likely several different values. A smaller variance means you''ll get lesser different values. Have a look at these two PDFs:</p>
<figure><img alt="The different variances" src="/static/img/tut/random_distribution_variance.gif" /><figcaption>
<p>THe different variances</p>
</figcaption>
</figure>
<p>The one on the left is "broader". So you''ll end up getting lots of -73s and 49s. But the one on the right isn''t. You won''t end up with lots of -73s and 49s. I hope you get an idea.</p>
<p>Mathematics of PDFs allows you to precisely calculate the value of the mean and variance. But again, we won''t go into all those details. Just these ideas are enough for us to build upon our image processing and computer vision knowledge </p>
<h2>The Gaussian Noise Distribution</h2>
<figure><img alt="The Gaussian Distribution" src="/static/img/tut/gaussian_distrubution.gif" /><figcaption>
<p>The gaussian distribution</p>
</figcaption>
</figure>
<p>The figure above shows two gaussian PDFs. Now, if they represent noise, what would it mean? </p>
<p>Considering the blue PDF: the mean value of the noise will be -2. So, on an average, 2 would be subtracted from all pixels of the image. You''ll also have 7 being subtracted... or even 3 being added as noise. This is because the distribution extends of a broad range of values.</p>
<p>In the red PDF, the mean value is 3. So on an average, 3 would be added to all pixels. You''ll see some pixels having 1 added or 5 added. But because the distribution isn''t that wide, you''ll see a narrow variation in noise. </p>
<p>Example:</p>
<p><img alt="" src="/static/img/tut/noise_tester.jpg" /></p>
<p><img alt="An image with gaussian noise" src="/static/img/tut/noise_tester_gaussian.jpg" /></p>
<p>Above: The original image. Below: The image with gaussian noise. The histogram for each of these images is: </p>
<p><img alt="The original image''s histogram" src="/static/img/tut/noise_tester_no_hist.jpg" /></p>
<p><img alt="Histogram of a gaussian noised image" src="/static/img/tut/noise_tester_gaussian_hist.jpg" /></p>
<p>The upper image is the histogram for the original image. Because it has only 2 colours, there are just two spikes.</p>
<p>The lower image is the histogram for noisy image. When noise is added, notice how "gaussian-like" the histogram becomes. Each spike in the original image "turns" into something similar to a gaussian distribution. That is exactly the reason why it is called gaussian noise. It usually occurs in an image due to noise in electronic circuits and noise in the sensor itself (maybe due to poor illumination or at times even high temperature).</p>
<p>Also, this type of noise is called Independent noise. Thats because the noise does not have any relation with the actual image data. It just occurs randomly. </p>
<h2>The Gamma Noise Distribution</h2>
<p>Just like gaussian, the Gamma distribution has a distinct PDF. Here it is:</p>
<figure><img alt="The Gamma Distribution" src="/static/img/tut/gamma_distribution.gif" /><figcaption>
<p>The gamma distribution</p>
</figcaption>
</figure>
<p>Applying gamma noise to an image produces the following results:</p>
<p><img alt="" src="/static/img/tut/noise_tester.jpg" /> <img alt="The test image with Gamma noise applied" src="/static/img/tut/noise_tester_gamma.jpg" /> Again, here are the histograms:</p>
<figure><img alt="The original image''s histogram" src="/static/img/tut/noise_tester_no_hist.jpg" /><figcaption>
<p>Original histogram</p>
</figcaption>
</figure>
<figure><img alt="Histogram with a gamma noised image" src="/static/img/tut/noise_tester_gamma_hist.jpg" /><figcaption>
<p>Histogram after noise</p>
</figcaption>
</figure>
<p>Again, adding gamma noise "turns" the spike into a gamma distribution like thingy. Also, this is independent noise.</p>
<p>Next, we''ll see 2 similar noise distributions, one completely different noise distribution (the salt and pepper noise) and also the unique uniform noise distribution. </p>','/static/img/tut/post-noise.jpg','2010-01-09',1,2,'noise-models-1');
INSERT INTO "aishack_tutorial" VALUES('Noise reduction by Averaging','',45,'<h2>What?! Averaging? You mean blurring?</h2>
<p>No. This method does not use any type of blurring to reduce noise in a particular image. Infact, the result is the opposite blurring: you get sharp images!</p>
<p>In the averaging method, it is assumed that you have several images of the same object... each with a different "noise pattern". This is exactly what can be easily obtained when taking pictures of distant galaxies. The gigantic telescopes just keep looking at the same object. The noise does affect the images, but at the end of the day, you get multiple images of the object with different "noise patterns"... which is exactly what''s needed.</p>
<p>Once you have multiple images, you average them. Yes, the average you learned in school: sum and divide by the total number of images.</p>
<p>You take a coordinate, sum up the value at the position in all images. And divide this sum by the total number of images. We''ll look at why this works on the next page. For now, I''ll just demonstrate to you this technique using OpenCV. </p>
<h2>Getting ready for the experiment!</h2>
<p>Firstly, you need to get multiple pictures... each having some noise. I used photoshop and the Automate option to generate 25 images, each with 8% guassian noise. If you want, you can simply download the 25 pictures below, or generate your own if you wish!</p>
<p><img alt="ZIP File" src="/static/img/tut/zip_file_download.png" /></p>
<p>Download a pack of 25 images with noise <em>(link broken just yet)</em></p>
<p>Next, create a new project. If you''re new to OpenCV, you might want to go through the OpenCV for Beginners article series. </p>
<h2>Juggling code</h2>
<p>First, make sure you include the OpenCV library files cv.lib cvaux.lib cxcore.lib highgui.lib. Next, include these headers: </p>
<div class="codehilite"><pre><span class="cp">#include &lt;cv.h&gt;</span>
<span class="cp">#include &lt;highgui.h&gt;</span>
</pre></div>


<p>Now, onto the main function. </p>
<div class="codehilite"><pre><span class="kt">int</span> <span class="nf">main</span><span class="p">()</span>
<span class="p">{</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgRed</span><span class="p">[</span><span class="mi">25</span><span class="p">];</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgGreen</span><span class="p">[</span><span class="mi">25</span><span class="p">];</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgBlue</span><span class="p">[</span><span class="mi">25</span><span class="p">];</span>
</pre></div>


<p>We begin by declaring three array of 25 image... one for each channel. We''ll load the 25 images into these variables now: </p>
<div class="codehilite"><pre>    <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">i</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">i</span><span class="o">&lt;</span><span class="mi">25</span><span class="p">;</span><span class="n">i</span><span class="o">++</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="n">IplImage</span><span class="o">*</span> <span class="n">img</span><span class="p">;</span>
        <span class="kt">char</span> <span class="n">filename</span><span class="p">[</span><span class="mi">150</span><span class="p">];</span>
        <span class="n">sprintf</span><span class="p">(</span><span class="n">filename</span><span class="p">,</span> <span class="s">&quot;%d.jpg&quot;</span><span class="p">,</span> <span class="p">(</span><span class="n">i</span><span class="o">+</span><span class="mi">1</span><span class="p">));</span>
        <span class="n">img</span> <span class="o">=</span> <span class="n">cvLoadImage</span><span class="p">(</span><span class="n">filename</span><span class="p">);</span>
        <span class="n">imgRed</span><span class="p">[</span><span class="n">i</span><span class="p">]</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvGetSize</span><span class="p">(</span><span class="n">img</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>
        <span class="n">imgGreen</span><span class="p">[</span><span class="n">i</span><span class="p">]</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvGetSize</span><span class="p">(</span><span class="n">img</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>
        <span class="n">imgBlue</span><span class="p">[</span><span class="n">i</span><span class="p">]</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvGetSize</span><span class="p">(</span><span class="n">img</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>
        <span class="n">cvSplit</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="n">imgRed</span><span class="p">[</span><span class="n">i</span><span class="p">],</span> <span class="n">imgGreen</span><span class="p">[</span><span class="n">i</span><span class="p">],</span> <span class="n">imgBlue</span><span class="p">[</span><span class="n">i</span><span class="p">],</span> <span class="nb">NULL</span><span class="p">);</span>
        <span class="n">cvReleaseImage</span><span class="p">(</span><span class="o">&amp;</span><span class="n">img</span><span class="p">);</span>
    <span class="p">}</span>
</pre></div>


<p>Lets go through the above code line by line. We create a loop (we need to go through 25 images remember?) Inside the loop, we create an image img. This img will temporarily hold an image loaded. Next, we "print into a character string" the name of the file to be loaded. So the variable filename will hold 1.jpg, 2.jpg, etc through the iterations. Then we load the image into img.</p>
<p>Next,we actually allocate memory for the 3 channels of the image loaded. If you don''t, you''ll end up getting a runtime error. Then, you split img into its constituent channels. </p>
<p>And now that we''ve split the image, we can safely delete img from the memory to free up some crucial RAM.</p>
<p>Okay, so with that done, we add the following lines: </p>
<div class="codehilite"><pre>    <span class="n">CvSize</span> <span class="n">imgSize</span> <span class="o">=</span> <span class="n">cvGetSize</span><span class="p">(</span><span class="n">imgRed</span><span class="p">[</span><span class="mi">0</span><span class="p">]);</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgResultRed</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">imgSize</span><span class="p">,</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgResultGreen</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">imgSize</span><span class="p">,</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>

    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgResultBlue</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">imgSize</span><span class="p">,</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>

    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgResult</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">imgSize</span><span class="p">,</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">3</span><span class="p">);</span>
</pre></div>


<p>These variables hold the result we''ll achieve after removing noise by averaging. We''re just declaring these variables and allocating memory for them.</p>
<p>Now for the real stuff. Actually doing the averaging: </p>
<div class="codehilite"><pre>    <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">y</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">y</span><span class="o">&lt;</span><span class="n">imgSize</span><span class="p">.</span><span class="n">height</span><span class="p">;</span><span class="n">y</span><span class="o">++</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">x</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">x</span><span class="o">&lt;</span><span class="n">imgSize</span><span class="p">.</span><span class="n">width</span><span class="p">;</span><span class="n">x</span><span class="o">++</span><span class="p">)</span>
        <span class="p">{</span>
            <span class="kt">int</span> <span class="n">theSumRed</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span>
            <span class="kt">int</span> <span class="n">theSumGreen</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span>
            <span class="kt">int</span> <span class="n">theSumBlue</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span>
            <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">i</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">i</span><span class="o">&lt;</span><span class="mi">25</span><span class="p">;</span><span class="n">i</span><span class="o">++</span><span class="p">)</span>
            <span class="p">{</span>
                <span class="n">theSumRed</span><span class="o">+=</span><span class="n">cvGetReal2D</span><span class="p">(</span><span class="n">imgRed</span><span class="p">[</span><span class="n">i</span><span class="p">],</span> <span class="n">y</span><span class="p">,</span> <span class="n">x</span><span class="p">);</span>
                <span class="n">theSumGreen</span><span class="o">+=</span><span class="n">cvGetReal2D</span><span class="p">(</span><span class="n">imgGreen</span><span class="p">[</span><span class="n">i</span><span class="p">],</span> <span class="n">y</span><span class="p">,</span> <span class="n">x</span><span class="p">);</span>
                <span class="n">theSumBlue</span><span class="o">+=</span><span class="n">cvGetReal2D</span><span class="p">(</span><span class="n">imgBlue</span><span class="p">[</span><span class="n">i</span><span class="p">],</span> <span class="n">y</span><span class="p">,</span> <span class="n">x</span><span class="p">);</span>
            <span class="p">}</span>
            <span class="n">theSumRed</span> <span class="o">=</span> <span class="p">(</span><span class="kt">float</span><span class="p">)</span><span class="n">theSumRed</span><span class="o">/</span><span class="mf">25.0f</span><span class="p">;</span>
            <span class="n">theSumGreen</span> <span class="o">=</span> <span class="p">(</span><span class="kt">float</span><span class="p">)</span><span class="n">theSumGreen</span><span class="o">/</span><span class="mf">25.0f</span><span class="p">;</span>
            <span class="n">theSumBlue</span> <span class="o">=</span> <span class="p">(</span><span class="kt">float</span><span class="p">)</span><span class="n">theSumBlue</span><span class="o">/</span><span class="mf">25.0f</span><span class="p">;</span>
            <span class="n">cvSetReal2D</span><span class="p">(</span><span class="n">imgResultRed</span><span class="p">,</span> <span class="n">y</span><span class="p">,</span> <span class="n">x</span><span class="p">,</span> <span class="n">theSumRed</span><span class="p">);</span>
            <span class="n">cvSetReal2D</span><span class="p">(</span><span class="n">imgResultGreen</span><span class="p">,</span> <span class="n">y</span><span class="p">,</span> <span class="n">x</span><span class="p">,</span> <span class="n">theSumGreen</span><span class="p">);</span>
            <span class="n">cvSetReal2D</span><span class="p">(</span><span class="n">imgResultBlue</span><span class="p">,</span> <span class="n">y</span><span class="p">,</span> <span class="n">x</span><span class="p">,</span> <span class="n">theSumBlue</span><span class="p">);</span>
        <span class="p">}</span>
    <span class="p">}</span>
</pre></div>


<p>We loop through each and every pixel of the image using the first two for loops. Next, we define variables that will hold the sum of the pixels (ie their value) of the 25 different noisy images for each channel.</p>
<p>Then we simply loop through each of the 25 images, getting the value at the current (x, y) and adding it to the respective sum variable. </p>
<p>Once we''re done summing up the 25 images, we divide the sum by 25. (hey, we had 25 images!) And then we set the "averaged" value into the result variables!</p>
<p>Finally, once we''re done looping through the images, we merge the different channels and display the image: </p>
<div class="codehilite"><pre>    <span class="n">cvMerge</span><span class="p">(</span><span class="n">imgResultRed</span><span class="p">,</span> <span class="n">imgResultGreen</span><span class="p">,</span> <span class="n">imgResultBlue</span><span class="p">,</span> <span class="nb">NULL</span><span class="p">,</span> <span class="n">imgResult</span><span class="p">);</span>
    <span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;averaged&quot;</span><span class="p">);</span>
    <span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;averaged&quot;</span><span class="p">,</span> <span class="n">imgResult</span><span class="p">);</span>

    <span class="n">cvWaitKey</span><span class="p">(</span><span class="mi">0</span><span class="p">);</span>

    <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


<p>Simple enough right? Here''s the result I got from the program: </p>
<figure><img alt="Noisy 1" src="/static/img/tut/1.jpg" /><figcaption>
<p>Very noisy right? (1.jpg)</p>
</figcaption>
</figure>
<figure><img alt="The final result" src="/static/img/tut/averaging_result.jpg" /><figcaption>
<p>Wha?! Where''s the noise?!?!</p>
</figcaption>
</figure>
<h2>Now for the theory</h2>
<p>Pretty amazing results right? And this happened with just 25 images. Just imagine the quality of images you''d get if you just sit and take snapshots constantly (like the telescopes do).</p>
<p>Next, we''ll take a look at <a href="/tutorials/noise-reduction-by-averaging-theory/">a bit of theory</a> on exactly how this works.</p>','/static/img/tut/post-noise-reduction-averaging.jpg','2010-01-13',1,3,'noise-reduction-by-averaging');
INSERT INTO "aishack_tutorial" VALUES('Noise reduction by Averaging: Theory','',46,'<h2>Now for the theory</h2>
<p>Pretty amazing results right? And this happened with just 25 images. Just imagine the quality of images you''d get if you just sit and take snapshots constantly (like the telescopes do). </p>
<h2>Probability does it all</h2>
<p>Noise is random in nature. Its also guassian in nature. What that means is, if you had a piece of noise like:</p>
<figure><img alt="Gaussian noise" src="/static/img/tut/noise_guassian.jpg" /><figcaption>
<p>Gaussian noise</p>
</figcaption>
</figure>
<p>Now if you were to sum up the intensities of each pixel and then divide it by the total number of pixels, you''ll end up with a zero (or a value very much near 0).</p>
<p>So, if you have multiple images with different noise patterns... its very likely that averaging corresponding pixels will cause the noise to vanish. </p>
<h2>Mathematically...</h2>
<p>Let g<sub>i</sub> denote each of the 25 images. So, g<sub>i</sub> is a sum of the original image (denoted by f) and some noise (denoted by n<sub>i</sub>).</p>
<p><img alt="The image, mathematically" src="/static/img/tut/image_noise_sum.jpg" /></p>
<p>The operation we''re performing in this technique is:</p>
<p><img alt="Averaging operation done" src="/static/img/tut/noise_average_operation_done.jpg" /></p>
<p>We''re summing up the k images (25 in our case) and dividing it by k. But we know that:</p>
<p><img alt="The sum is zero!" src="/static/img/tut/sum_noise_zero.jpg" /></p>
<p>So on expanding the expression for I(x,y) we end up with only f(x,y)... which is the original image! </p>
<h2>More images mean better noise removal</h2>
<p>The more images you have, the better the noise removal. This sounds plausible because ideally, if you have an infinite number of cases... only then will the sum of the noise be exactly zero.</p>
<p>I did a little experiment on how the quality of the image improves as the number of noisy images increases. See the results for yourself: </p>
<figure><img alt="Noisy 1" src="/static/img/tut/1.jpg" /><figcaption>
<p>No averaging (1.jpg)</p>
</figcaption>
</figure>
<figure><img alt="Result of averaging two images" src="/static/img/tut/averaging_two.jpg" /><figcaption>
<p>Averaging with only 2 images</p>
</figcaption>
</figure>
<figure><img alt="Averaging five images" src="/static/img/tut/averaging_five.jpg" /><figcaption>
<p>Averaging with 5 images (quality just improved greatly!)</p>
</figcaption>
</figure>
<figure><img alt="After fifteen images" src="/static/img/tut/averaging_fifteen.jpg" /><figcaption>
<p>Averaging with fifteen images (the image looks clean!)</p>
</figcaption>
</figure>
<figure><img alt="The final result" src="/static/img/tut/averaging_result.jpg" /><figcaption>
<p>Averaging with 25 images (no real visible improvement)</p>
</figcaption>
</figure>
<p>So apparently, after a few iterations of averaging, the quality of the image reaches a plateau. </p>
<h2>Conclusion</h2>
<p>So now you have a great new technique in your arsenal that you can use whenever required! If you have any doubts or criticism or suggestions, do let me know!</p>
<p><a href="/tutorials/noise-reduction-by-averaging/">Have a look at the actual C implementation</a></p>','/static/img/tut/post-noise-reduction-averaging.jpg','2010-01-15',1,2,'noise-reduction-by-averaging-theory');
INSERT INTO "aishack_tutorial" VALUES('Normalized RGB','',47,'<h2>What is normalized RGB?</h2>
<p>At times, you want to get rid of distortions caused by lights and shadows in an image. Normalizing the RGB values of an image can at times be a simple and effective way of achieving this.</p>
<p>When normalizing the RGB values of an image, you divide each pixel''s value by the sum of the pixel''s value over all channels. So if you have a pixel with intensitied R, G, and B in the respective channels... its normalized values will be R/S, G/S and B/S (where, S=R+G+B).</p>
<p>Here''s an example (I tried this out when working on the soccer bot I made):</p>
<figure><img alt="Normalized RGB" src="/static/img/tut/normalized-rgb.jpg" /><figcaption>
<p>Normalized RGB</p>
</figcaption>
</figure>
<p>The upper image is the original shot taken from a camera. The lower image is its normalized version. It might not look pretty, but take note of some key changes in the image: </p>
<ul>
<li>The shadows are the white edges have vanished</li>
<li>The black and white circles have become indistinguishable</li>
<li>The entire goal posts are not one solid colour.</li>
</ul>
<p>Now this might not be the best picture to showoff normalized RGB. But it gets the point through. (If you find a better example, please let me know!!). </p>
<h2>Writing code for this</h2>
<p>We''ll write a short function that will convert a given RGB image into a normalized RGB image. We begin by writing the function definition: </p>
<div class="codehilite"><pre><span class="n">IplImage</span><span class="o">*</span> <span class="nf">NormalizeImage</span><span class="p">(</span><span class="n">IplImage</span><span class="o">*</span> <span class="n">theimg</span><span class="p">)</span>
<span class="p">{</span>
</pre></div>


<p>Now we create 3 more images. Each to hold the 3 channels of theimg. </p>
<div class="codehilite"><pre>    <span class="n">IplImage</span><span class="o">*</span> <span class="n">redchannel</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvGetSize</span><span class="p">(</span><span class="n">theimg</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">greenchannel</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvGetSize</span><span class="p">(</span><span class="n">theimg</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">bluechannel</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvGetSize</span><span class="p">(</span><span class="n">theimg</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>
</pre></div>


<p>And then, we create 4 images: one to hold the final normalized image and 3 to temporarily hold the channels of the normalized image: </p>
<div class="codehilite"><pre>    <span class="n">IplImage</span><span class="o">*</span> <span class="n">redavg</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvGetSize</span><span class="p">(</span><span class="n">theimg</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">greenavg</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvGetSize</span><span class="p">(</span><span class="n">theimg</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>

    <span class="n">IplImage</span><span class="o">*</span> <span class="n">blueavg</span><span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvGetSize</span><span class="p">(</span><span class="n">theimg</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>

    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgavg</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvGetSize</span><span class="p">(</span><span class="n">theimg</span><span class="p">),</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">3</span><span class="p">);</span>
</pre></div>


<p>Next, we copy the 3 channels of the original image into redchannel, greenchannel and bluechannel. </p>
<div class="codehilite"><pre>    <span class="n">cvSplit</span><span class="p">(</span><span class="n">theimg</span><span class="p">,</span> <span class="n">bluechannel</span><span class="p">,</span> <span class="n">greenchannel</span><span class="p">,</span> <span class="n">redchannel</span><span class="p">,</span> <span class="nb">NULL</span><span class="p">);</span>
</pre></div>


<p>Next, we setup loops to iterate through each pixel of the image... </p>
<div class="codehilite"><pre>    <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">x</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">x</span><span class="o">&lt;</span><span class="n">theimg</span><span class="o">-&gt;</span><span class="n">width</span><span class="p">;</span><span class="n">x</span><span class="o">++</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">y</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">y</span><span class="o">&lt;</span><span class="n">theimg</span><span class="o">-&gt;</span><span class="n">height</span><span class="p">;</span><span class="n">y</span><span class="o">++</span><span class="p">)</span>
        <span class="p">{</span>
</pre></div>


<p>...and find out the R, G and B values at this pixel: </p>
<div class="codehilite"><pre>            <span class="kt">int</span> <span class="n">redValue</span> <span class="o">=</span> <span class="n">cvGetReal2D</span><span class="p">(</span><span class="n">redchannel</span><span class="p">,</span> <span class="n">y</span><span class="p">,</span> <span class="n">x</span><span class="p">);</span>
            <span class="kt">int</span> <span class="n">greenValue</span> <span class="o">=</span> <span class="n">cvGetReal2D</span><span class="p">(</span><span class="n">greenchannel</span><span class="p">,</span> <span class="n">y</span><span class="p">,</span> <span class="n">x</span><span class="p">);</span>
            <span class="kt">int</span> <span class="n">blueValue</span> <span class="o">=</span> <span class="n">cvGetReal2D</span><span class="p">(</span><span class="n">bluechannel</span><span class="p">,</span> <span class="n">y</span><span class="p">,</span> <span class="n">x</span><span class="p">);</span>
</pre></div>


<p>Then, we calculate S = R+G+B: </p>
<div class="codehilite"><pre>            <span class="kt">double</span> <span class="n">sum</span> <span class="o">=</span> <span class="n">redValue</span><span class="o">+</span><span class="n">greenValue</span><span class="o">+</span><span class="n">blueValue</span><span class="p">;</span>
</pre></div>


<p>And finally, we set the normalized values into the 3 channel images we created for the final normalized image: </p>
<div class="codehilite"><pre>            <span class="n">cvSetReal2D</span><span class="p">(</span><span class="n">redavg</span><span class="p">,</span> <span class="n">y</span><span class="p">,</span> <span class="n">x</span><span class="p">,</span> <span class="n">redValue</span><span class="o">/</span><span class="n">sum</span><span class="o">*</span><span class="mi">255</span><span class="p">);</span>
            <span class="n">cvSetReal2D</span><span class="p">(</span><span class="n">greenavg</span><span class="p">,</span> <span class="n">y</span><span class="p">,</span> <span class="n">x</span><span class="p">,</span> <span class="n">greenValue</span><span class="o">/</span><span class="n">sum</span><span class="o">*</span><span class="mi">255</span><span class="p">);</span>
            <span class="n">cvSetReal2D</span><span class="p">(</span><span class="n">blueavg</span><span class="p">,</span> <span class="n">y</span><span class="p">,</span> <span class="n">x</span><span class="p">,</span> <span class="n">blueValue</span><span class="o">/</span><span class="n">sum</span><span class="o">*</span><span class="mi">255</span><span class="p">);</span>
        <span class="p">}</span>
    <span class="p">}</span>
</pre></div>


<p>After all this looping, we''ll have the final channels of the normalized image. We merge these into the final image: </p>
<div class="codehilite"><pre>    <span class="n">cvMerge</span><span class="p">(</span><span class="n">blueavg</span><span class="p">,</span> <span class="n">greenavg</span><span class="p">,</span> <span class="n">redavg</span><span class="p">,</span> <span class="nb">NULL</span><span class="p">,</span> <span class="n">imgavg</span><span class="p">);</span>
</pre></div>


<p>Once all of this is done, we erase the temporary images we had created, and return the result:</p>
<div class="codehilite"><pre>    <span class="n">cvReleaseImage</span><span class="p">(</span><span class="o">&amp;</span><span class="n">redchannel</span><span class="p">);</span>
    <span class="n">cvReleaseImage</span><span class="p">(</span><span class="o">&amp;</span><span class="n">greenchannel</span><span class="p">);</span>
    <span class="n">cvReleaseImage</span><span class="p">(</span><span class="o">&amp;</span><span class="n">bluechannel</span><span class="p">);</span>
    <span class="n">cvReleaseImage</span><span class="p">(</span><span class="o">&amp;</span><span class="n">redavg</span><span class="p">);</span>
    <span class="n">cvReleaseImage</span><span class="p">(</span><span class="o">&amp;</span><span class="n">greenavg</span><span class="p">);</span>

    <span class="n">cvReleaseImage</span><span class="p">(</span><span class="o">&amp;</span><span class="n">blueavg</span><span class="p">);</span>

    <span class="k">return</span> <span class="n">imgavg</span><span class="p">;</span>

<span class="p">}</span>
</pre></div>


<p>Using the function we just created is simple. You give it an image in the RGB colour space. And it returns a new image in the normalized RGB form. </p>
<h2>You''re losing information</h2>
<p>The normalized image can be represented using only 2 bytes per pixel (as opposed to 3 bytes per pixel in RGB). Here''s how:</p>
<p>R'' = R/(R+G+B) G'' = G/(R+G+B)</p>
<p>B'' = B/(R+G+B)</p>
<p>But you can represent B'' like this as well: </p>
<p>B'' = 1-R''-G''</p>
<p>So ultimately, all you need to store is the value of R'' and G''. You can calculate the B'' component from the other two. Physically, its this loss of information that "removes" the lighting information from the image. </p>
<h2>Conclusion</h2>
<p>Hopefully this article helped add a new tool to your arsenal of techniques and algorithms.</p>','/static/img/tut/post-normalized-rgb.jpg','2010-01-17',1,3,'normalized-rgb');
INSERT INTO "aishack_tutorial" VALUES('Template matching','',48,'<h2>Wait... PowerPoint had templates!!!</h2>
<p>Those aren''t the templates we''re talking about. Template matching is an algorithm that can help you locate certain features in a given image. But the condition is, you need to know exactly what you''re looking for.</p>
<p>An example might make it clearer. Lets say you have the image below:</p>
<figure><img alt="A random image" src="/static/img/tut/Technophilia_logo.jpg" /><figcaption>
<p>Our source image</p>
</figcaption>
</figure>
<p>Lets say we''re looking for a "p" in the image. So, we''re looking for the following image:</p>
<figure><img alt="The template" src="/static/img/tut/Technophilia_logo_template.jpg" /><figcaption>
<p>The template to search for</p>
</figcaption>
</figure>
<p>Thats'' the "template" we''re looking for in the original image. I hope that takes care of the template part of the title. Now for the matching part...</p>
<h2>Matching</h2>
<p>Template matching works by "sliding" the template across the original image. As it slides, it compares or matches the template to the portion of the image directly under it.</p>
<figure><img alt="The technique" src="/static/img/tut/template_matching_technique.jpg" /><figcaption>
<p>The technique</p>
</figcaption>
</figure>
<p>It does this matching by calculating a number. This number denotes the extent to which the template and the portion of the original are equal. The actual number depends on the calculation used. Some denote a complete match by a 0 (indicating no difference between the template and the portion of original) or a 1 (indicating a complete match). </p>
<h2>How OpenCV does template matching</h2>
<p>When you perform template matching in OpenCV, you get an image that shows the degree of "equality" or correlation between the template and the portion under the template. </p>
<figure><img alt="The technique" src="/static/img/tut/template_matching_technique.jpg" /><figcaption>
<p>The technique</p>
</figcaption>
</figure>
<p>The template is compared against its background, and the result of the calculation (a number) is stored at the top left pixel. Here''s what the actual "correlation map" looks like:</p>
<figure><img alt="The result of template matching" src="/static/img/tut/template-matching-result.jpg" /><figcaption>
<p>The result of template matching</p>
</figcaption>
</figure>
<p>The greater the intensity, the greater the correlation between the template and the portion. As you can see, the two "t" in the side in the original image don''t really match with the p, so you get a relatively darker region there.</p>
<p>To find out where the P lies in the image, you simply find the location where you have the greatest correlation (or, minimum difference) and that would be your answer. </p>
<h2>On with the code</h2>
<p>Enough of theory, now we begin with the code. Create a new Win32 console project, name it whatever you want and accept the default settings. You''ll get an empty project with a main function. First, add these header files to the code: </p>
<div class="codehilite"><pre><span class="cp">#include &quot;cv.h&quot;</span>
<span class="cp">#include &quot;highgui.h&quot;</span>
</pre></div>


<p>Next, add the library files to the project. Go to Project &gt; Properties &gt; Configuration &gt; Linker &gt; Input and write cv.lib cxcore.lib cvaux.lib highgui.lib in Additional Dependencies.</p>
<p>If you have any problems with setting this up, I suggest you go through Installing and Getting OpenCV running and "Hello, world!" with images!</p>
<p>Now we get into the main function: </p>
<div class="codehilite"><pre><span class="kt">int</span> <span class="nf">main</span><span class="p">()</span>
<span class="p">{</span>
</pre></div>


<p>Next, we load the original image and the template: </p>
<div class="codehilite"><pre><span class="err">   </span> <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgOriginal</span> <span class="o">=</span> <span class="n">cvLoadImage</span><span class="p">(</span><span class="s">&quot;technophilia.jpg&quot;</span><span class="p">,</span> <span class="mi">0</span><span class="p">);</span>
    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgTemplate</span> <span class="o">=</span> <span class="n">cvLoadImage</span><span class="p">(</span><span class="s">&quot;template.jpg&quot;</span><span class="p">,</span> <span class="mi">0</span><span class="p">);</span>
</pre></div>


<p>Note that I force loading as grayscale image, just to keep things simple. Next, we create a blank image the will hold the correlation map: </p>
<div class="codehilite"><pre>    <span class="n">IplImage</span><span class="o">*</span> <span class="n">imgResult</span> <span class="o">=</span> <span class="n">cvCreateImage</span><span class="p">(</span><span class="n">cvSize</span><span class="p">(</span><span class="n">imgOriginal</span><span class="o">-&gt;</span><span class="n">width</span><span class="o">-</span><span class="n">imgTemplate</span><span class="o">-&gt;</span><span class="n">width</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span> <span class="n">imgOriginal</span><span class="o">-&gt;</span><span class="n">height</span><span class="o">-</span><span class="n">imgTemplate</span><span class="o">-&gt;</span><span class="n">height</span><span class="o">+</span><span class="mi">1</span><span class="p">),</span> <span class="n">IPL_DEPTH_32F</span><span class="p">,</span> <span class="mi">1</span><span class="p">);</span>
    <span class="n">cvZero</span><span class="p">(</span><span class="n">imgResult</span><span class="p">);</span>
</pre></div>


<p>See the weird size we''re giving this image? That has a perfectly sane explanation. Have a look at the picture below:</p>
<figure><img alt="Boundary limits of the template" src="/static/img/tut/template_matching_limits.jpg" /><figcaption>
<p>Boundary limits of the template traversal</p>
</figcaption>
</figure>
<p>The correlation map can only extend from the top left corner to the big black dot on the lower right corner. Thats because if the template were to slide any further, you''d get a partial template image... and that would be absurd. So you subtract the height and width of the template from the original image''s height and width, and add one.</p>
<p>Now for the instruction-of-the-tutorial: </p>
<div class="codehilite"><pre>    <span class="n">cvMatchTemplate</span><span class="p">(</span><span class="n">imgOriginal</span><span class="p">,</span> <span class="n">imgTemplate</span><span class="p">,</span> <span class="n">imgResult</span><span class="p">,</span> <span class="n">CV_TM_CCORR_NORMED</span><span class="p">);</span>
</pre></div>


<p>This instruction does all the sliding and correlation mathematics using imgOriginal (the source), imgTemplate (the template) and puts the correlation map into imgResult. The calculations used for determining the correlation map is the last parameter, CV_TM_CCORR_NORMED.</p>
<p>OpenCV offers six different calculation methods: </p>
<ul>
<li>CV_TM_SQDIFF</li>
<li>CV_TM_SQDIFF_NORMED</li>
<li>CV_TM_CCORR</li>
<li>CV_TM_CCORR_NORMED</li>
<li>CV_TM_CCOEFF</li>
<li>CV_TM_CCOEFF_NORMED</li>
</ul>
<p>The NORMED calculations give values upto 1.0... the other ones return huge values. SQDIFF is a difference based calculation that gives a 0 at a perfect match. The other two (CCORR and CCOEFF) are correlation based, and return a 1.0 for a perfect match.</p>
<p>To determine the maximum point in the correlation, we use another OpenCV function: cvMinMaxLoc. This function returns the minimum and maximum values and their locations. So, we use it: </p>
<div class="codehilite"><pre>    <span class="kt">double</span> <span class="n">min_val</span><span class="o">=</span><span class="mi">0</span><span class="p">,</span> <span class="n">max_val</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span>
    <span class="n">CvPoint</span> <span class="n">min_loc</span><span class="p">,</span> <span class="n">max_loc</span><span class="p">;</span>
    <span class="n">cvMinMaxLoc</span><span class="p">(</span><span class="n">imgResult</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">min_val</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">max_val</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">min_loc</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">max_loc</span><span class="p">);</span>
</pre></div>


<p>Now max_loc holds the point we''re interested in: the point with maximum correlation. We''ll just put a rectangle there, and also print out the actual value of correlation... just for the sake of demonstration: </p>
<div class="codehilite"><pre>    <span class="n">cvRectangle</span><span class="p">(</span><span class="n">imgOriginal</span><span class="p">,</span> <span class="n">max_loc</span><span class="p">,</span> <span class="n">cvPoint</span><span class="p">(</span><span class="n">max_loc</span><span class="p">.</span><span class="n">x</span><span class="o">+</span><span class="n">imgTemplate</span><span class="o">-&gt;</span><span class="n">width</span><span class="p">,</span> <span class="n">max_loc</span><span class="p">.</span><span class="n">y</span><span class="o">+</span><span class="n">imgTemplate</span><span class="o">-&gt;</span><span class="n">height</span><span class="p">),</span> <span class="n">cvScalar</span><span class="p">(</span><span class="mi">0</span><span class="p">),</span> <span class="mi">1</span><span class="p">);</span>
    <span class="n">printf</span><span class="p">(</span><span class="s">&quot;%f&quot;</span><span class="p">,</span> <span class="n">max_val</span><span class="p">);</span>
</pre></div>


<p>And we finally display the modified original image, and exit: </p>
<div class="codehilite"><pre>    <span class="n">cvNamedWindow</span><span class="p">(</span><span class="s">&quot;result&quot;</span><span class="p">);</span>
    <span class="n">cvShowImage</span><span class="p">(</span><span class="s">&quot;result&quot;</span><span class="p">,</span> <span class="n">imgOriginal</span><span class="p">);</span>
    <span class="n">cvWaitKey</span><span class="p">(</span><span class="mi">0</span><span class="p">);</span>
    <span class="k">return</span> <span class="mi">0</span><span class="p">;</span>

<span class="p">}</span>
</pre></div>


<p>Here''s the result I got:</p>
<figure><img alt="The final output" src="/static/img/tut/template-matching-final-output.jpg" /><figcaption>
<p>The final output</p>
</figcaption>
</figure>
<p>That seems very accurate. I got a correlation of 0.98. That''s because of the little R. It isn''t present in the template, so it takes its toll. That, and the fact that JPEG images put a little noise around the edges, combined reduce the correlation. </p>
<h2>Disadvantages of template matching</h2>
<p>Well, the first disadvantage is that you need to know what you''re looking for. If you''re looking for dynamic features, you''ll be better off using some other techniques.</p>
<p>Secondly, template matching provided by OpenCV doesn''t let you check for rotations and scalings. If the P in our example was rotated by 90 degrees, the current program would never find it. You could write code for it though. A brute force algorithm would be to generate all possible rotations, all possible scales and then do the matching. But that would be extremely slow. So again, use some other techniques. </p>
<h2>We''re done!</h2>
<p>Hope you learned something from this tutorial. I tried to be as clear and precise as I could.</p>','/static/img/tut/post-template-matching.jpg','2010-01-21',1,3,'template-matching');
INSERT INTO "aishack_tutorial" VALUES('Installing and configuring OpenCV 2.0 on Windows','',49,'<p>Installing the latest OpenCV might seem intimidating to you. After all, you need to compile all that source code and generate libraries and executables yourself. So here''s a little guide to take you through. </p>
<h2>Step 1: Install OpenCV 2.0</h2>
<p>Go to the <a href="http://opencv.sourceforge.net">SourceForge page of OpenCV</a> and install OpenCV 2.0. If you check the directory you installed the things in, you see that there a folder called src. We need to use that compile OpenCV. </p>
<h2><img alt="" src="/static/img/tut/cv2_srcfolder.jpg" /></h2>
<h2>Step 2: Install CMake</h2>
<p>CMake is a cross platform "make" (the linux make). You can <a href="http://www.cmake.org/cmake/resources/software.html">download it for free</a> here. With CMake, you can use the command line interface. Or, if you want, a GUI that makes life easier. </p>
<h2>Step 3: Compile everything</h2>
<p>Once you install, start up the command line prompt. (Win+R, type cmd and press enter). Type cmake and you should be able to see something on screen.</p>
<p>Next, type in this line: </p>
<div class="codehilite"><pre><span class="n">cd</span> <span class="n">C</span><span class="o">:</span><span class="err">\\</span><span class="n">OpenCV2</span><span class="mf">.0</span>
<span class="n">mkdir</span> <span class="n">build</span>
<span class="n">cd</span> <span class="n">build</span>
<span class="n">cmake</span> <span class="o">-</span><span class="n">D</span><span class="o">:</span><span class="n">CMAKE_BUILD_TYPE</span><span class="o">=</span><span class="n">RELEASE</span> <span class="n">C</span><span class="o">:</span><span class="err">\\</span><span class="n">OpenCV2</span><span class="mf">.0</span>
</pre></div>


<p>You''ll see a lot of things happening. And after a while, the process would complete, and you''d have a Visual Studio Project for OpenCV.</p>
<h2>Step 4: Compile the project</h2>
<p>This one is simple. Double click the OpenCV project, and compile it. It''ll take a lot of time. Compiling the samples and the entire library itself takes a real long time.</p>
<p><img alt="" src="/static/img/tut/cv2_made.jpg" /></p>
<p>Now, the following folders contain what we want </p>
<ul>
<li>C:\OpenCV2.0\src\lib\Debug</li>
<li>C:\OpenCV2.0\src\bin\Debug</li>
</ul>
<p>All the .lib and .dll files have been generated in those folders. </p>
<h2>Step 5: Configuring OpenCV in VisualStudio</h2>
<p>Now we need to tell Visual Studio where these newly generated files .lib are. So open up the Options dialog box (Tools &gt; Options) and select the VC++ Directories tab as shown below:</p>
<p><img alt="" src="/static/img/tut/vc2k8_directories.jpg" /></p>
<p>Now we''ll add to the Executable Files, Include Files, and Library Files.</p>
<p>Add <em>C:\OpenCV2.0\src\bin\Debug</em> to the <strong>Executable Files</strong>. </p>
<p>Add <em>C:\OpenCV2.0\include\opencv</em> to the <strong>Include Files</strong>.</p>
<p>Add C:\OpenCV2.0\src\lib\Debug to the <strong>Library Files</strong>. </p>
<h2>Step 6: Testing the installation</h2>
<p>Just to test that OpenCV is working, we''ll create a simple "Hello World!" program. You can have a look at that program here: <a href="/tutorials/hello-world-with-images/">Hello World! with Images</a>.</p>
<p>Just get the entire code done, and return back to this article. </p>
<p>[get the code now :P]</p>
<p>Now that you have the code, we need to tell Visual Studio that we need to use the OpenCV libraries. So open up the Project properties (<em>Project &gt; </em>[project name]<em> Properties</em>). Then go to Configuration <em>Properties &gt; Linker &gt; Input</em> and add the following into <em>Additional dependencies</em>: </p>
<div class="codehilite"><pre><span class="n">cv200d</span><span class="p">.</span><span class="n">lib</span> <span class="n">cxcore200d</span><span class="p">.</span><span class="n">lib</span> <span class="n">highgui200d</span><span class="p">.</span><span class="n">lib</span> <span class="n">cvaux200d</span><span class="p">.</span><span class="n">lib</span> <span class="n">ml200d</span><span class="p">.</span><span class="n">lib</span>
</pre></div>


<p>Next, take all the .dll files in C:\OpenCV2.0\src\bin\Debug directory and copy them into <em>C:\Windows\System32</em>. On most systems, this will work. If not, try copying them into <em>C:\Windows</em> as well.</p>
<p>(Thanks for <strong>Shaurya </strong>for pointing out ml200d.lib library) </p>
<h2>Done!</h2>
<p>If everything worked, you just got a working OpenCV 2.0 installation :) Enjoy!</p>
<p>If you were following the <strong>Beginner''s guide to OpenCV</strong>, go to the next part: <a href="/tutorials/hello-world-with-images/">Hello World! with Images</a>!</p>','/static/img/tut/post-opencv-2-windows.jpg','2010-03-03',1,3,'installing-and-configuring-opencv-2-on-windows');
INSERT INTO "aishack_tutorial" VALUES('Pixel neighbourhoods and connectedness','',50,'<p>The idea of neighbourhoods of pixels and their connectedness is quite intuitive. But formalizing it''s definition and knowing what it means "exactly" has its advantages. So here are the things you need to know about neighbourhoods and connectedness of pixels in an image. </p>
<h2>What is a neighbourhood?</h2>
<p>The neighbourhood of a pixel is the set of pixels that touch it. Simple as that. Thus, the neighbourhood of a pixel can have a maximum of 8 pixels (images are always considered 2D).</p>
<figure><img alt="" src="/static/img/tut/neighbourhood.jpg" /><figcaption>
<p>The orange pixels form the neighbourhood of the pixel ''p''.</p>
</figcaption>
</figure>
<p>Neighbourhoods of more specific nature exist for various applications. Here''s a list of them: </p>
<h2>4-neighbourhood</h2>
<p>The neighbourhood consisting of only the pixels directly touching. That is, the pixel above, below, to the left and right for the 4-neighbourhood of a particular pixel.</p>
<figure><img alt="" src="/static/img/tut/neighbourhood-4.jpg" /><figcaption>
<p>Here, the orange pixels for the 4-neighbourhood of the pixel ''p''. </p>
</figcaption>
</figure>
<h2>d-neighbourhood</h2>
<p>This neighbourhood consists of those pixels that do not touch it, or they touch the corners. That is, the diagonal pixels.</p>
<figure><img alt="" src="/static/img/tut/neighbourhood-d.jpg" /><figcaption>
<p>The diagonal neighbourhood of the pixel ''p'' is shown in orange. </p>
</figcaption>
</figure>
<h2>8-neighbourhood</h2>
<p>This is the union of the 4-neighbourhood and the d-neighbourhood. It is the maximuim possible neighbourhood that a pixel can have.</p>
<figure><img alt="" src="/static/img/tut/neighbourhood.jpg" /><figcaption>
<p>The 8 neighborhood</p>
</figcaption>
</figure>
<h2>Connectivity</h2>
<p>Two pixels are said to be "connected" if they belong to the neighbourhood of each other.</p>
<figure><img alt="" src="/static/img/tut/connectivity.jpg" /><figcaption>
<p>Connectivity of pixels</p>
</figcaption>
</figure>
<p>All the coloured pixels are "connected" to ''p''... or, they are 8-connected to p. However, only the green ones are ''4-connected to p. And the orange ones are d-connected to p.</p>
<p>Now, if you have several pixels, they are said to be connected if there is some "chain-of-connection" between any two pixels.</p>
<figure><img alt="" src="/static/img/tut/connectivity-multiple.jpg" /><figcaption>
<p>Multiple connectivity</p>
</figcaption>
</figure>
<p>Here, lets say you''re "bunch" or set of pixels is the white ones. Then, the pixels p1 and p2 are connected. There exists a chain of pixels which are connected to each other. However, the pixels p1 and p3 are not connected. The black pixels (which are not in your set) block the connectivity. </p>
<h2>Connected components</h2>
<p>Taking the idea of connectivity to the next level, we get to the idea of connected components. A graphic best serves to explain this idea:</p>
<figure><img alt="" src="/static/img/tut/connected-components.jpg" /><figcaption>
<p>Connected components</p>
</figcaption>
</figure>
<p>This image has two connected components. And these exist efficient algorithms that let you figure out the different connected components in an image easily.</p>','/static/img/tut/post-pixel-neighbor.jpg','2010-03-15',1,2,'pixel-neighbourhoods-and-connectedness');
INSERT INTO "aishack_tutorial" VALUES('Connected Component Labelling','',51,'<p>One common problem encountered in image analysis is to figure out which parts of an object are "connected", physically. That is, irrespective of the colour. Here''s an example: </p>
<p><img alt="" src="/static/img/tut/labelling-example.jpg" /></p>
<p>In the above image, the red and green circles are distinct. But the goal is not to detect circles (you can do that using the <a href="/tutorials/circle-hough-transform/">Circle Hough Transform</a>). The goal is to identify the two "blobs". Each blob consisting of two circles, one red and one green. </p>
<p>So, the desired output is something like this:</p>
<p><img alt="" src="/static/img/tut/labelling-labelled.jpg" /></p>
<p>With this type of output, you can easily figure out how many components the image has, and which pixels are connected. The blue pixels are all connected and form one component. Similarly, the green one. </p>
<h2>Label</h2>
<p>In the current context, labeling is just giving a pixel a particular value. For example, in the previous picture, all pixels in the blue region have the label ''1''. Pixels in the green region have the label ''2''. The white region, or the background, has the label ''0''. This, the problem is to ''label'' connected regions in an image. </p>
<h2>Another example</h2>
<p>Here''s an image generated internally by multitouch applications. The goal is to label each "finger" so that the application can differentiate between the thumb, little finger, etc.</p>
<p><img alt="" src="/static/img/tut/connected-mt.jpg" /></p>
<p>After labeling, the image looks something like this:</p>
<p><img alt="" src="/static/img/tut/connected-mt-labelled.jpg" /></p>
<p>Now the application can distinguish between each "finger" very easily. </p>
<h2>The recursive algorithm</h2>
<p>The recursive algorithm is pretty straightforward. You take a pixel, and check its neighbours for connectivity. But, it''s inefficient. As the image size grows, the time taken by the algorithm increases rather quickly. So we won''t get into the details of this algorithm.</p>
<h2>The classical algorithm</h2>
<p>The algorithm designed by <strong>Rosenfeld and Pfaltz in 1966 </strong>uses the union-find data structure to solve this problem (read about the union-find data structure), and that too quite efficiently. Its "classical" because it uses a result from the the classical algorithm for connectedness in graph theory.</p>
<p>The algorithm consists of two passes. In the first pass, the algorithm goes through each pixel. It checks the pixel above and to the left. And using these pixel''s labels (which have already been assigned), it assigns a label to the current pixel. And in the second pass, it cleans up any mess it might have created, like multiple labels for connected regions.</p>
<p>So that was the overview of how the algorithm works. Now we get into the details. </p>
<h2>The First Pass</h2>
<p>In the first pass, every pixel is checked. One by one, starting at the top left corner, and moving linearly to the bottom right corner.</p>
<p><img alt="" src="/static/img/tut/labelling-top-left.jpg" /></p>
<p>If you''re considering the pixel ''p'', you''ll only check the orange pixels. Thus, at any given time, you only need to have two rows of the image in memory. This helped in memory efficiency in the past, but now we have 2GB RAMs. So its not an issue these days.</p>
<p>We''ll go through each step of the first pass one by one. </p>
<h3>Step 1</h3>
<p>Here we check if we''re interested in a pixel or not. If the pixel is a background pixel (its value is zero, or whatever other criteria you want), we simply ignore it and move on to the next pixel. If not, you go to the next step. </p>
<h3>Step 2 and 3</h3>
<p>Here, you''re fetching the label of the pixels just above and to the left of ''p''. And you store them (into A and B here). Now, there are a few possible cases here: </p>
<ul>
<li>The pixel above or/and the the left aren''t background pixels: In this case, things proceed as usual. You just go to the next step. A or/and B will have actual values (the labels).</li>
<li>Both pixels are background pixels: In this case, you cannot get labels. So, you create a new label, and store it into A and B.</li>
</ul>
<h3>Step 4 and 5</h3>
<p>You figure out which one is smaller: A or B and then you set that label to pixel ''p''. </p>
<h3>Step 6</h3>
<p>Suppose you have a situation where pixel above has a label A and the pixel to the left has a label B. But you know that these two labels are connected (because the current pixel "connects them" ).</p>
<p><img alt="" src="/static/img/tut/labelling-parenting.jpg" /></p>
<p>Thus, you need to store the information that the labels ''A'' and ''B'' are actually the same. And you do that using the union-find data structure. You set the label ''A'' as the child of ''B''. Using this information, the algorithm will clean up the mess in the second mess.</p>
<p>The only thing you need to remember is that the smaller label get assigned to ''p'', and the larger number becomes a child of the smaller number. </p>
<h3>Step 7</h3>
<p>Go to the next pixel. </p>
<h2>The second pass</h2>
<p>Again, the algorithm goes through each pixel, one by one. It checks the label of the current pixel. If the label is a ''root'' in the union-find structure, it goes to the next pixel.</p>
<p>Otherwise, it follows the links to the parent until it reaches the root. Once it reaches the root, it assigns that label to the current pixels. </p>
<h2>Done!</h2>
<p>That''s all there is in this algorithm. You might want to go through <a href="/tutorials/labelling-connected-components-example/">the example</a> where I go through each pixel, one by one.</p>','/static/img/tut/post-connected-components.jpg','2010-03-18',1,2,'connected-component-labelling');
INSERT INTO "aishack_tutorial" VALUES('Labelling connected components - Example','',52,'<p>We''ll go through an example for <a href="/tutorials/connected-component-labelling/">Labelling connected components</a> algorithm. I assume you know how the algorithm works (if not, check <a href="../tutorials/connected-component-labelling/">Labelling connected components</a>) and also how the union-find data structure works. We''ll work on a binary image to keep things simple. Suppose the binary image is the following: </p>
<p><img alt="" src="/static/img/tut/label-example-binary.jpg" /></p>
<p>The "blocks" represent a pixel. White means its a ''1'' and black means its a ''0''. We''re interested in labeling the non-zero pixels. Ideally, you can just loop at the image and come up with a possible labeling scheme:</p>
<p><img alt="" src="/static/img/tut/label-binary-final.jpg" /></p>
<p>The actual labels are just 1, 2, 3, 4, etc. Here, the colors are just a visual representation of the actual labels.</p>
<p>Now that you know what''s about to happen,, lets get started. </p>
<h2>The first pass</h2>
<p>Here is the same image, represented as a matrix. We start off at the top left corner.</p>
<p><img alt="" src="/static/img/tut/label-binary-matrix1.jpg" /></p>
<p>We check the top and left pixels. They do not exist... so we need to create a new label. Thus, we set the label for the top left pixel as 1 (shown as yellow).</p>
<p><img alt="" src="/static/img/tut/label-step1.jpg" /></p>
<p>Next we check the pixel in row 1, column 2, or simply pixel (1, 2). It does has a pixel to its left. So we copy its label. The next pixel, (1, 3) is a background pixel. We''re not interested in it. So we simply skip it and let it be black (a label of 0).</p>
<p>Next comes the pixel (1, 4). There are no pixels above it. But the pixel to its left is a background pixel. So we create a new label. So, we mark (1, 4) with label 2 (shown as dark yellow). </p>
<p><img alt="" src="/static/img/tut/label-step2.jpg" /></p>
<p>Now the next two pixels, (1, 5) and(1, 6) will have pixel to their left. So, they get the label 2 as well. (1, 7) is background so we ignore it. At (1,8) we''ll have to create a new label again (pixel above does not exist, and pixel to left is a background pixel). </p>
<p>So, after completing row 1, we have a result that looks like this:</p>
<figure><img alt="" src="/static/img/tut/label-step3.jpg" />  <figcaption>
<p>After row 1 is complete  </p>
</figcaption>
</figure>
<p>Now the pixel (2, 1) does not have anything to its left. But it does have a pixel just above it. Its label is ''1'', so we copy that. Similarly for (2, 2). Infact, the same thing holds for the entire row. All pixels in the second row have a pixel just above them. So the result looks like this:</p>
<figure><img alt="" src="/static/img/tut/label-step4.jpg" />  <figcaption>
<p>Completion of row 2  </p>
</figcaption>
</figure>
<p>In the third row, pixels (3, 1) (3,2 ) and (3, 3) are quite straight forward. They get the label ''1''. But pixel (3, 4) is a tricky one. You have pixel both above and to the left. And both have different labels. Which one do you choose? How do you handle the sudden "realization" of the connectedness of labels 1 and 2.</p>
<p>Well, you take the smaller label (in this case ''1'') and put that on (3, 4). And, you also store that 2 (the numerically larger label) is a child of 1 (using the union-find data structure). </p>
<figure><img alt="" src="/static/img/tut/label-step5.jpg" />  <figcaption>
<p>Resolving the dilemma at (3, 4)  </p>
</figcaption>
</figure>
<p>Continuing on, you should face no difficulties. Here''s a set of images to guide you along to the final result of pass 1. </p>
<figure><img alt="" src="/static/img/tut/label-step6.jpg" />  <figcaption>
<p>After 4 rows  </p>
</figcaption>
</figure>
<figure><img alt="" src="/static/img/tut/label-step7.jpg" />  <figcaption>
<p>Completing 5 rows  </p>
</figcaption>
</figure>
<figure><img alt="" src="/static/img/tut/label-step8.jpg" />  <figcaption>
<p>Row 6, done  </p>
</figcaption>
</figure>
<figure><img alt="" src="/static/img/tut/label-step9.jpg" />  <figcaption>
<p>Completing row 7, note the new label  </p>
</figcaption>
</figure>
<figure><img alt="" src="/static/img/tut/label-step101.jpg" />  <figcaption>
<p>First pass complete. Note the new label.  </p>
</figcaption>
</figure>
<h2>The second pass</h2>
<p>Now, you can see this labeling technique has made quite a mess. Multiple labels for connected regions. We need to rectify this.</p>
<p>To do this, we again go through every pixel one by one. It starts with pixel (1, 1). It checks the union-find data structure for the label ''1''. On checking, it figures out that ''1'' is not a child of any other labels. It is a root itself. So it moves on. </p>
<p>Similarly for (1, 2). For the pixel (1, 3) we''re not concerned because it is a background pixel.</p>
<p>Now on pixel (1,4) it checks the data structure for ''2''. It notices that ''2'' is a child of ''1''. Then, it checks for ''1''. It notices ''1'' is a root. So, it replaces the label of (1, 4) with ''1'': </p>
<figure><img alt="" src="/static/img/tut/label-step11.jpg" />  <figcaption>
<p>Converting a ''2'' into a ''1''  </p>
</figcaption>
</figure>
<p>Similarly, the process goes on for the entire row. The result after completing 4 rows is: </p>
<figure><img alt="" src="/static/img/tut/label-step12.jpg" />  <figcaption>
<p>Completing till row 4  </p>
</figcaption>
</figure>
<p>We''ve made progress! The connected region on the top right is fully cleaned up. Great! Now, row 5 remains unchanged. ''4'' is a root label. So is ''5''. And ''3'' as well. Row 6 also remains unchanged. </p>
<p>Now, row 7 undergoes changes:</p>
<figure><img alt="" src="/static/img/tut/label-step13.jpg" />  <figcaption>
<p>Completing row 7  </p>
</figcaption>
</figure>
<p>And after doing row 8, here''s the final result:</p>
<figure><img alt="" src="/static/img/tut/label-step14.jpg" />  <figcaption>
<p>The final result  </p>
</figcaption>
</figure>
<p>And thus you have the final result. And its the result we want. Every connected region has exactly one value. </p>
<h2>Done!</h2>
<p>Well that was a pretty in depth example. Hope you learned a bit from this!</p>','/static/img/tut/post-connected-components.jpg','2010-03-21',1,3,'labelling-connected-components-example');
INSERT INTO "aishack_tutorial" VALUES('Fast connected components labeling','',53,'<p>Labeling connected components in an image is a common operation. But the original algorithm proposed is slow. It works fine if the image is small. But as the image becomes larger, the algorithm slows down really fast. Recently, a few researchers find a simple solution to this. Image that previously took hundreds of seconds would not take only a couple of seconds to get labeled. </p>
<h2>The original connected components labeling algorithm</h2>
<p>A binary image has only ones and zeroes. The goal of labeling connected components is to identify which ones are "connected".</p>
<p><img alt="" src="/static/img/tut/labelling-example.jpg" /></p>
<p>For example, if the above image, the goal is to identify that the two circles on the left are connected. Sure, they are separate circles, but they are "connected". They share the same boundary. Similarly for the two circles on the right.</p>
<p>The original algorithm is a two pass algorithm. The first pass marks labels for each pixel and the second pixel marks corrects invalid labels. You might want to read more about the <a href="/tutorials/connected-component-labelling/">connected components labeling algorithm</a>. You might also want to check <a href="/tutorials/labelling-connected-components-example/">an example on how the connected components labeling algorithm works</a>. </p>
<h2>The divide and conquer approach</h2>
<p>The main bottleneck of the algorithm is the large equivalence array (the union-find structure). Calculating and resolving equivalent labels for one big image takes a lot of time. However, if the image is divided into several regions (say the image is split into 3x3 parts), then the labels can be computed and resolved much faster.</p>
<p><img alt="Spliting an image into multiple grids" src="/static/img/tut/fast-ccl-split.jpg" /></p>
<p>After splitting, you execute the standard algorithm on each part. Now you need to resolve any anomalies that might exist at the borders of each part.</p>
<p>This resolution is done in three parts: </p>
<ol>
<li>Check the top-left pixel of each part (this pixel connects three other parts: to the left, above and the one diagonally)</li>
<li>Check the leftmost column of pixels (this column connects the current part to the left)</li>
<li>Check the topmost column of pixels (this column connects the current part to the part above it)</li>
</ol>
<p>For each case, you fix any wrong labeling that might exist.</p>
<p>The next step is to determine the number of pieces the image is split in. Experimentally, it was found that each piece should be 30<em>30 pixels - 60</em>60 pixels in size. That way, the equivalence array is small enough to be computed rapidly. </p>
<h2>Results</h2>
<p>The researchers did experiments with a 1760*1168 image. This image is HUGE. The standard algorithm would take a lot of time. It simply isn''t feasible to calculate the time it takes.</p>
<p>On dividing, the following times were obtained: </p>
<ul>
<li>4x4 split: 274.57 seconds</li>
<li>5x5 split: 160.22 seconds</li>
<li>10x10 split: 12.47 seconds</li>
<li>15x15 split: 4.01 seconds</li>
<li>20x20 split: 2.75 seconds</li>
<li>25x25 split: 2.47 seconds</li>
</ul>
<p>They also compared it against other methods of computing labels. This algorithm clearly surpassed the results any other algorithm could produce. </p>
<h2>Summary</h2>
<p>You learned about a new connected component labeling algorithm that computes labels for large images really fast. Have a look at the actual paper for pseudo code on how to implement it.</p>','/static/img/tut/post-connected-components.jpg','2010-08-18',1,2,'fast-connected-components-labeling');
INSERT INTO "aishack_tutorial" VALUES('Primitive structures in OpenCV','',54,'<p>OpenCV comes with several predefined structures, including <code>CvScalar</code>, <code>CvPoint</code>, etc. But the three most important structures are <code>CvArr</code>, <code>CvMat</code> and <code>IplImage</code>. You can call them the primitive data types for OpenCV. From the C point of view, these are not exactly ''primitive'' data types. But they are the fundamental data types on which OpenCV manipulates (resize, threshold, etc). </p>
<h2>Inheritance</h2>
<p>The three structures are "related" to each other by "inheritance". No, its not the C++ or Java inheritance. OpenCV was made using C, so there''s no such concept. But, their relation mimics inheritance.</p>
<figure><img alt="" src="/static/img/tut/opencv-inheritance.jpg" /><figcaption>
<p>Inheritence in OpenCV</p>
</figcaption>
</figure>
<p><code>CvArr</code> is the "base" class. Think of it like an abstract class. It is merely used as parameters for various functions. You never actually create an "object" of <code>CvArr</code>.</p>
<p><code>CvMat</code> is "derived" from <code>CvArr</code>. Logically, a matrix is nothing but an extension of an array. So it makes sense. These matrices aren''t the ones you had studied in school. Its a generalization. Matrices can be N dimensional. And each "element" of this matrix can hold more than one values (technically, every element is a tuple). </p>
<p><code>IplImage</code> is the structure that actually holds images that have to be manipulated. You''ll use this a LOT in OpenCV. With this structure, you can store images in multiple formats: single, three, or four channels, and each channel holding integers (in various formats) or floating point decimals.</p>
<p>This is your "normal" image is a 3 channel 8-bit image. While manipulating, you''ll come across several operators that return "images" in other formats as well. </p>
<p>Another important point to note: If you see <code>CvArr</code> as a parameter to some function, you can pass a <code>CvMat</code> or an <code>IplImage</code>. Both are acceptable. Similarly, if you see <code>CvMat</code> as a parameter, you can pass a <code>CvMat</code> (obviously) or an <code>IplImage</code>. But If you see <code>IplImage</code>, you can only pass <code>IplImage</code>.</p>
<p>It works just like inheritance, where you can pass derived classes in place to parent classes.</p>','/static/img/tut/post-opencv.jpg','2010-03-24',1,3,'primitive-structures-in-opencv');
INSERT INTO "aishack_tutorial" VALUES('Features: What are they?','',55,'<p>Several computer vision tasks require finding matching points across several frames or views. With that info, you could really do a lot of stuff. An example. When doing stereo imaging, you want to know a few corresponding points between the two views. Once you do, you can triangulate almost all points on the image (just like the brain does!). </p>
<h2>The first approach: Patches</h2>
<p>Intuitively, you''d be tempted to match small "patches" between the two images. Something like this:</p>
<p><img alt="" src="/static/img/tut/feature-patches-1.jpg" /></p>
<p>You want to find the left image''s green path in the right. And you can do that quite easily. The white thingy makes the patch quite unique. Even something as trivial as <a href="/tutorials/template-matching/">template matching</a> would be able to find it.</p>
<p>But, not all patches are so uniquely recognizable. Check the patches below: </p>
<p><img alt="" src="/static/img/tut/feature-patches-2.jpg" /></p>
<p>There are no unique "features" to identify on the wall. So you''ll have problem finding corresponding points. So the patches approach isn''t that great.</p>
<h2>Corners</h2>
<p>Corners in an image seem to be perfect for such tracking tasks. Here''s an example image:</p>
<p><img alt="" src="/static/img/tut/feature-corners-1.jpg" /></p>
<p>These corners are perfect! Why?</p>
<h3>Uniquely identifiable</h3>
<p>These points are uniquely identifiable. What do I mean by that? Here''s what. Lets say you''re trying to find the green corner in the right image (in the image below). You know that it''ll be somewhere around the same location. So you can narrow down the "search region". And within this search region, there would be only one point that resembles the corner.</p>
<p>Of course, the assumption here is that there isn''t a massive difference between the two images. And this is usually a reasonable assumption.</p>
<p><img alt="" src="/static/img/tut/features-corners-identifiable.jpg" /></p>
<h3>Stable</h3>
<p>These points usually don''t keep moving around in the image. This helps tracking. And any motion of this point, even a little one, produces a large variation. You can clearly see the point moving around.</p>
<h2>A bad feature</h2>
<p>I''ll try to make the idea of a "corner" more concrete. We''ll use some math to do this. How do you identify a bad feature? Something that doesn''t have a lot of variation... like the example of the wall above.</p>
<p>There are no edges or corners in the feature. So, the first derivative is flat, in both directions, x and y. Or, the first derivative is flat in all directions (all directions are a certain combination of the x and y component).</p>
<p>So, the second derivative also does not change in any direction. </p>
<h2>An edge</h2>
<p>An edge is a bad feature as well. If you move in the direction of the edge, you won''t even know you''re moving. For example, if you move along the edge at the top of the building and the sky, you won''t even realize it. </p>
<p><img alt="" src="/static/img/tut/features-edges-motion-inline.jpg" /></p>
<p>But if you move from the building to the sky (perpendicular to the edge) you''ll "see" motion. This is the only direction where you can accurately tell how fast the object is moving.</p>
<p><img alt="" src="/static/img/tut/features-edges-motion-perp.jpg" /></p>
<p>So edges aren''t that useful as features.</p>
<p>The first derivative changes in only the one direction (perpendicular to the edge). Some progress, but not that good. So, the second derivative also changes in only one direction. </p>
<h2>A corner</h2>
<p>A corner is an awesome feature! There''s variation all around a corner. So, the derivative changes in all directions. So the second derivative also changes in all directions! Great! And you can write pretty efficient programs to calculate that at all points.</p>
<p>So there you have it! Identifying good features: If the first derivative keeps changing around a point, you know you have a corner. And you also know you have a good feature to track! </p>
<h2>So what exactly is a feature?</h2>
<p>By now, you''ve hopefully have an idea of what a feature is. At least intuitively. If not, go read the post again... because there are no formal definitions of a feature till now. :P</p>','/static/img/tut/post-interesting-features.jpg','2010-04-23',1,2,'features-what-are-they');
INSERT INTO "aishack_tutorial" VALUES('Subpixel Corners: Increasing accuracy','',56,'<p>When working with images on a digital system, the smallest part of an image is a pixel. You simply cannot access information "between" pixels. But several application require higher accuracy than a camera can provide. For example, when reconstructing a 3D object from an image, you need accurate measurements. So, mathematical techniques were developed to increase the accuracy of detecting corners. Oh, and the infinite zoom that you see on CSI: Miami, we won''t be doing that. </p>
<h2>Why subpixel accuracy?</h2>
<p>Here''s a picture of a square. I''ve zoomed in a lot, so you can see individual pixels. Try finding <a href="/tutorials/features-what-are-they/">the corner</a> in this image. </p>
<p><img alt="" src="/static/img/tut/corner-multiple-pixels.jpg" /></p>
<p>You can see that the corner does not lie on a single pixel. The corner is "spread out" (In fact, in real life situations, it''s almost impossible to get corners to lie on exact pixels).</p>
<p>So, with a corner detection algorithm like <a href="../tutorials/the-shi-tomasi-corner-detector/">the Shi-Tomasi corner detector</a> or <a href="/tutorials/harris-corner-detector/">the Harris corner detector</a>, you will end up with a corner like (56, 120). But, scientists and other people want a corner like (56.768, 120.1432). </p>
<p>This is subpixel accuracy. You cannot access pixel (56.768, 120.1432), yet you have determined that the corner lies precisely at this point.</p>
<p>But, why go into the trouble of figuring out the decimal portion? Corners extremely important features in an image. And you need the extra precision for many situations: </p>
<ul>
<li>Tracking</li>
<li>Camera calibration</li>
<li>3D reconstruction</li>
<li>Stereo vision</li>
</ul>
<p>So a lot of effort has been put into getting better accuracy, faster. </p>
<h2>The technique</h2>
<p>We''ll go over a basic technique. It uses the familiar dot product (yes, the one you learned in school). A little bit of review about the dot product.</p>
<p>The dot product &lt;<strong>a</strong>, <strong>b</strong>&gt; is zero if one of the following holds (<strong>a</strong> and <strong>b</strong> are vectors): </p>
<ol>
<li>Either <strong>a</strong> or <strong>b</strong> is zero</li>
<li>Vectors <strong>a</strong> and <strong>b</strong> are perpendicular to each other (then cos90<sup>o</sup> = 0)</li>
</ol>
<p>Simple enough? Great! With that in mind, we dive into the algorithm.</p>
<p>The aim of the algorithm is to create several equations. On solving these equations, you increase the accuracy of the corner. Now, how do you create these equations? It''s a little trick that is employed. </p>
<p>You take two points, <strong>p</strong> and <strong>q</strong> on the image. <strong>q</strong> is the estimated corner position (the one with integer coordinates). <strong>p</strong> is any point around <strong>q</strong>.</p>
<p>It would look something like this: </p>
<p><img alt="" src="/static/img/tut/subpixel-two-points1.jpg" /></p>
<p>Now, the point <strong>q</strong> lies very near to the corner. So, <strong>p</strong> can lie at only one of the following two places: </p>
<ol>
<li>A flat region</li>
<li>On an edge</li>
</ol>
<p>In the above example, if you move <strong>p</strong> around, you''ll see why.</p>
<p>Lets consider option 1 first: a flat region</p>
<h2>Flat regions</h2>
<p>Assume <strong>p</strong> lies on a flat region. This means the gradient at <strong>p</strong> is zero (the rate of change is zero). So, the following dot product will always be zero (whatever the position of <strong>q</strong>):</p>
<p><img alt="" src="/static/img/tut/subpixel-zero-equation.jpg" /></p>
<p>The dot product of the two vectors (the gradient at <strong>p</strong>, and the vector <strong>q</strong>-<strong>p</strong>) will be zero. This is because the gradient is always zero.</p>
<h2>On edges</h2>
<p>When <strong>p</strong> lies on an edge, the gradient will be some definite vector (because the pixel values are changing). Also, <strong>q</strong>-<strong>p</strong> will be a vector. But in this case, the two will be perpendicular. Here''s an illustration:</p>
<p><img alt="" src="/static/img/tut/subpixel-two-points-edge.jpg" /></p>
<p>So again, the dot product will be zero: </p>
<p><img alt="" src="/static/img/tut/subpixel-zero-equation.jpg" /></p>
<p>This time, the two vectors are perpendicular to each other (or, orthogonal). So the dot product is zero. </p>
<h2>Several equations</h2>
<p>Using several such equations, you can form a system of equations. Each equation equal to zero. And when you solve for <strong>q</strong>, you get a higher accuracy corner.</p>
<p>Its as simple as that.</p>
<h2>Summary</h2>
<p>The key idea in generating several equations. To do this, the dot product is used. Using the approximate corner point and several points around it, many equations are formed. All these equations equal to zero. And on solving for the corner, you get a point with higher precision. It has digits after the decimal.</p>
<p>There also exist other techniques to get subpixel corners. Like iterative algorithms that try to minimize error, etc. But we won''t go into those right now.</p>
<p>OpenCV uses this technique to refine corner positions calculated by other techniques (like the <a href="/tutorials/the-shi-tomasi-corner-detector/">Shi-Tomasi corner detector</a> or the <a href="/tutorials/harris-corner-detector/">Harris corner detector</a>).</p>','/static/img/tut/post-subpixel-corners.jpg','2010-05-08',1,2,'subpixel-corners-increasing-accuracy');
INSERT INTO "aishack_tutorial" VALUES('Subpixel corners in OpenCV','',57,'<p>OpenCV comes with a function to help you find subpixel corners. It uses <a href="/tutorials/subpixel-corners-increasing-accuracy/">the dot product technique</a> to refine corners detected by other techniques, like <a href="/tutorials/the-shi-tomasi-corner-detector/">the Shi-Tomasi corner detector</a>. The function works iteratively, refining the corners till a termination criteria is reached. </p>
<h2>Refining corners to subpixel level</h2>
<p>The function that lets you calculate better corner positions is <code>cvFindCornerSubPix</code>: </p>
<div class="codehilite"><pre><span class="kt">void</span> <span class="nf">cvFindCornerSubPix</span><span class="p">(</span><span class="k">const</span> <span class="n">CvArr</span><span class="o">*</span> <span class="n">image</span><span class="p">,</span>
                        <span class="n">CvPoint2D32f</span><span class="o">*</span> <span class="n">corners</span><span class="p">,</span>
                        <span class="kt">int</span> <span class="n">count</span><span class="p">,</span>
                        <span class="n">CvSize</span> <span class="n">win</span><span class="p">,</span>
                        <span class="n">CvSize</span> <span class="n">zero_zone</span><span class="p">,</span>
                        <span class="n">CvTermCriteria</span> <span class="n">criteria</span><span class="p">);</span>
</pre></div>


<p>Before calling this function, you must use <a href="/tutorials/corner-detection-in-opencv/">cvGoodFeaturesToTrack</a> to find the approximate location of corners in an image. This function will then refine those estimates.</p>
<p>With that in mind, I''ll go through each one here. </p>
<p><strong>image</strong> - Quite basic, you pass the image you want to work on. This should be the same image you used in cvGoodFeaturesToTrack (or you''ll end up with weird results)</p>
<p><strong>corners</strong> - This is the array that holds the approximate corners initially. The function modifies this array with the refined corner positions.</p>
<p><strong>count </strong> - Quite basic, the number of points in the above array. Same as cvGoodFeaturesToTrack</p>
<p><strong>win_</strong> - The technique used by this function requires several equations. This is done by using several pixels around the corner. <em>win</em> lets you set the size of the window from which these pixels are taken. Example: cvSize(5, 5) </p>
<p><strong>zero_zone</strong> - Again, the technique used by this function solves several equations. The "solving" part is done using a matrix. This matrix is inverted to get a solution. However, some matrices are non-invertible. To prevent this, some pixels around the corner are ignored. zero_zone is that area.</p>
<p><img alt="" src="/static/img/tut/subpixel-opencv-demo.jpg" /></p>
<p>In the above picture, the red pixel is the (integer based) corner. <em>win</em> has been set to 7x7. <em>zero_zone</em> has been set to 3x3. So, only the green pixels are used to generating new equations. The grey pixels are ignored.</p>
<p><strong>criteria</strong> - This is used in several iterative algorithms of OpenCV. It lets you specify the type (<code>CV_TERMCRIT_ITER</code> or <code>CV_TERMCRIT_EPS</code> or both), the number of iterations and the desired accuracy. </p>
<h2>Summary</h2>
<p>OpenCV lets you easily refine integer based corners. A simple to use function that does all the heavy duty work of iteratively increasing the accuracy of the supplied corners.</p>
<p>Also, I''ve attached a sample project to demonstrate the function.</p>','/static/img/tut/post-subpixel-corners.jpg','2010-05-11',1,3,'subpixel-corners-in-opencv');
INSERT INTO "aishack_tutorial" VALUES('Efficiently accessing matrices','',58,'<p>I''ve talked previous about matrices in <a href="/tutorials/2d-matrices-with-cvmat-in-opencv/">2D matrices with CvMat in OpenCV</a>. I talked about accessing using the cvGet<em> and cvSet</em> functions. But in computer vision, you need to do things as efficiently as possible. And those functions increase the overhead. So here''s a super fast method of accessing data, using pointers. Don''t worry, it''s going to be easy! </p>
<h2>Pointer math</h2>
<p>The only thing you need to know is that the matrix elements are stored sequentially. And usually, you''d have two loops: the outer loop for the row, and a loop inside it for the column. And for each row and column, you can access the channel data.</p>
<p>Some code will clear up the idea: </p>
<div class="codehilite"><pre><span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">row</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">row</span><span class="o">&lt;</span><span class="n">mat</span><span class="o">-&gt;</span><span class="n">rows</span><span class="p">;</span><span class="n">row</span><span class="o">++</span><span class="p">)</span>
<span class="p">{</span>
    <span class="k">const</span> <span class="kt">float</span><span class="o">*</span> <span class="n">ptr</span> <span class="o">=</span> <span class="p">(</span><span class="k">const</span> <span class="kt">float</span><span class="o">*</span><span class="p">)(</span><span class="n">mat</span><span class="o">-&gt;</span><span class="n">data</span><span class="p">.</span><span class="n">ptr</span> <span class="o">+</span> <span class="n">row</span><span class="o">*</span><span class="n">mat</span><span class="o">-&gt;</span><span class="n">step</span><span class="p">);</span>
    <span class="k">for</span><span class="p">(</span><span class="kt">int</span> <span class="n">col</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="n">col</span><span class="o">&lt;</span><span class="n">mat</span><span class="o">-&gt;</span><span class="n">cols</span><span class="p">;</span><span class="n">col</span><span class="o">++</span><span class="p">)</span>
    <span class="p">{</span>
        <span class="kt">float</span> <span class="n">c1</span> <span class="o">=</span> <span class="o">*</span><span class="n">ptr</span><span class="o">++</span><span class="p">;</span>
        <span class="kt">float</span> <span class="n">c2</span> <span class="o">=</span> <span class="o">*</span><span class="n">ptr</span><span class="o">++</span><span class="p">;</span>
        <span class="kt">float</span> <span class="n">c3</span> <span class="o">=</span> <span class="o">*</span><span class="n">ptr</span><span class="o">++</span><span class="p">;</span>
        <span class="kt">float</span> <span class="n">c4</span> <span class="o">=</span> <span class="o">*</span><span class="n">ptr</span><span class="o">++</span><span class="p">;</span>
    <span class="p">}</span>
<span class="p">}</span>
</pre></div>


<p>You can see the outer <em>row</em> loop. Inside it is the column loop, <em>col</em>. And inside both, you access the channel data for a particular pixel (I assumed a 4 channel matrix, <em>CV_32FC4</em>).</p>
<p>Simple eh? And its efficient too! </p>
<p><span class="tut-warn">Note that I calculate <code>ptr</code> for every row. That''s because you can setup a "region of interest" in images. And this matrix might be a part of that. So you can''t say that rows are continuous in memory. However, individual elements of a particular row will always be continuous in memory.</span></p>
<p>Oh! You might want to check <a href="/tutorials/memory-layout-of-matrices-of-multidimensional-objects/">Memory layout of matrices of multi-dimensional objects</a>. I''ve gone into detail about how matrices are stored in memory. And for one particular case, it''s drastically different. Make sure you check that article as well. </p>
<h2>Done!</h2>
<p>With that, I think you should be able to access your matrices much more efficiently! Got questions? Suggestions or criticism? Let me know! Leave a comment!</p>','/static/img/tut/post-opencv.jpg','2010-04-20',1,3,'efficiently-accessing-matrices');
INSERT INTO "aishack_tutorial" VALUES('Image Convolutions in OpenCV','',59,'<p>Convolutions are a very important tool for anyone interested in signal processing. <a href="/tutorials/convolutions/">Image Convolutions</a> is a simpler method to do convolutions on images. And <a href="/tutorials/image-convolution-examples/">they have a lot of uses too</a>. So of course, OpenCV does have a way to do image convolutions easily and super efficiently! </p>
<h2>OpenCV''s Convolution Function</h2>
<h3>The C++ convolution function</h3>
<p>The one single function that does image convolutions in OpenCV is the Filter2D function. Here''s the syntax: </p>
<div class="codehilite"><pre><span class="kt">void</span> <span class="nf">filter2D</span><span class="p">(</span><span class="n">Mat</span> <span class="n">src</span><span class="p">,</span>
              <span class="n">Mat</span> <span class="n">dst</span><span class="p">,</span>
              <span class="kt">int</span> <span class="n">ddepth</span><span class="p">,</span>
              <span class="n">Mat</span> <span class="n">kernel</span><span class="p">,</span>
              <span class="n">Point</span> <span class="n">anchor</span><span class="p">,</span>
              <span class="kt">double</span> <span class="n">delta</span><span class="p">,</span>
              <span class="kt">int</span> <span class="n">borderType</span><span class="p">);</span>
</pre></div>


<p>You''ll have to include the <em>cv</em> namespace for the above to work. You can do that with</p>
<div class="codehilite"><pre><span class="k">using</span> <span class="k">namespace</span> <span class="n">cv</span><span class="p">;</span>
</pre></div>


<p>Now for the parameters: </p>
<ul>
<li><strong>src: </strong><em>(input)</em> This is the image that you want to convolve.</li>
<li><strong>dst: </strong><em>(input)</em> This image stores the final result of the convolution. It should be the same size and have the same number of channels as <strong>src</strong>. This can be the same as <strong>src</strong> (in place operation is supported).</li>
<li><strong>ddepth: </strong><em>(input)</em> This is the desired bit depth of the final result (8, 16, 32, etc). It it is negative, the depth is the same as the source image.</li>
<li><strong>kernel: </strong><em>(input)</em> The convolution kernel used to convolve the source image. This has to be a single channel, floating point matrix. If you want to apply different kernels to different channels, you need to split the channels, and convolve each of them them individually.</li>
<li><strong>anchor: </strong><em>(input)</em> The relative position of the anchor in the kernel matrix. If this is set to (-1,-1), the center of the kernel is used as the anchor point.</li>
<li><strong>delta: </strong><em>(input)</em> A value that is added to all pixels after convolution.</li>
<li><strong>borderType: </strong><em>(input)</em> Possible values for this include: <ul>
<li>BORDER_REPLICATE</li>
<li>BORDER_CONSTANT</li>
<li>BORDER_REFLECT_101</li>
<li>BORDER_WARP</li>
<li>BORDER_TRANSPARENT</li>
<li>BORDER_DEFAULT (same as reflect)</li>
<li>BORDER_ISOLATED</li>
</ul>
</li>
</ul>
<p>Here''s some example code: </p>
<div class="codehilite"><pre><span class="n">filter2D</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="n">imgFiltered</span><span class="p">,</span> <span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="n">kernelLoG</span><span class="p">,</span> <span class="n">Point</span><span class="p">(</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span><span class="o">-</span><span class="mi">1</span><span class="p">),</span> <span class="mf">5.0</span><span class="p">,</span> <span class="n">BORDER_REPLICATE</span><span class="p">);</span>
</pre></div>


<p>The image <em>img</em> is filtered and stored in <em>imgFiltered</em>. The bit depth of <em>imgFiltered</em> will be the same as <em>img</em> (the <em>-1</em>). The convolution will be done using the matrix <em>kernelLog</em> whose anchor is at the center. Also, after the convolution is done, a value of <em>5.0</em> will be added to all pixels. The borders are taken care of by replicating pixels around the edges. </p>
<h3>The C image convolution function</h3>
<p>The C equivalent of the above function is: </p>
<div class="codehilite"><pre><span class="n">cvFilter2D</span><span class="p">(</span><span class="n">IplImage</span><span class="o">*</span> <span class="n">src</span><span class="p">,</span>
           <span class="n">IplImage</span><span class="o">*</span> <span class="n">dst</span><span class="p">,</span>
           <span class="n">CvMat</span><span class="o">*</span> <span class="n">kernel</span><span class="p">,</span>
           <span class="n">CvPoint</span> <span class="n">anchor</span><span class="p">);</span>
</pre></div>


<p>Very similar to the C++ equivalent and a lot simpler too. It doesn''t have a lot of extra parameters. </p>
<ul>
<li><strong>src: </strong> <em>(input)</em> The image you want to convolve.</li>
<li><strong>dst: </strong> <em>(input)</em> The image where the result of the convolution is stored</li>
<li><strong>kernel: </strong> <em>(input)</em> The matrix used to convolve the image.</li>
<li><strong>anchor: </strong> <em>(input)</em> The anchor point of the kernel. If this is (-1,-1) the center of the kernel matrix is used as the anchor.</li>
</ul>
<p>Pixels "outside" the image are set to the value of the pixel nearest inside the image.</p>
<h2>A few things to keep in mind</h2>
<p>The filtering function actually calculates correlation. If you have a symmetrical convolution kernel, the mathematical expressions for correlation and convolution are the same.</p>
<p>If the kernel is not symmetric, you must flip the kernel and set the anchor point to (kernel.cols - anchor.x - 1, kernel.rows - anchor.y - 1). This will calculate the actual convolution.</p>
<p>Also, it isn''t always necessary that the filtering will happen on the image directly. If the convolution kernel is large enough, OpenCV will automatically switch to a discrete Fourier transform based algorithm for speedy execution. </p>
<h2>Summary</h2>
<p>You got to know how convolutions are done in OpenCV. You learned about the C++ function as well as the C function.</p>','/static/img/tut/post-convolutions.jpg','2010-08-20',1,3,'image-convolutions-in-opencv');
INSERT INTO "aishack_tutorial" VALUES('K-Nearest Neighbours: Classify (recognize) things','',60,'<p>Recognizing things is a common problem in machine learning. Even in the <a href="/tutorials/detecting-a-sudoku-puzzle-in-an-image-part-1/">SuDoKu Solver demo</a>, we require a mechanism to identify digits in the SuDoKu grid. To do this, we''ll use a simple algorithm called K-Nearest. It''s one of the simplest machine learning algorithms. The results aren''t going to be robust, but we''ll get some good results. </p>
<h2>The K-Nearest Neighborhood Classification Algorithm</h2>
<p>Like any machine learning algorithm, K-Nearest has two phases. In the first, you train the algorithm to recognize certain classes. In the second, you use all the training to classify test cases.</p>
<p>During the training phase, K-Nearest simply stores the training patterns you supply and their appropriate classification (which you supply). </p>
<p><img alt="Training a K-Nearest algorithm to classify images as a ''5'' or a ''0''" src="/static/img/tut/knearest-training.jpg" /></p>
<p>Suppose you want to train K-Nearest to identify the image as a ''5'' or a ''0''. So you would supply as many images of ''5'' and ''0'' as you can. You also tell the algorithm which image is what. This is called the label for an image. You''d ''label'' the first image above as a ''5''. Similarly the second image as a ''0'', and so on.</p>
<p>After you''re done training, you can have K-Nearest classify images for you. To classify an image, you must supply two things: the image to classify and a number k.</p>
<p>This k defines is the neighborhood in which training data is consulted. Consider this image:</p>
<p><img alt="Using k to calculate neighbourhood in k-nearest" src="/static/img/tut/k-nearest-neighbourhood.jpg" /></p>
<p>Here''s what everything in the figure means: </p>
<ul>
<li><strong>Thin solid arrows:</strong> These represent the training data. The arrows pointing to the top-right are for ''5'' and the ones pointing bottom-right are for ''0''. These are just images converted into a vector.</li>
<li><strong>Thick dashed arrows:</strong> These represent the testing data. Again, these two arrows are just images converted into vectors.</li>
<li><strong>Red dashed circles:</strong> These are circles of radius ''k''.</li>
</ul>
<p>Now <strong>here''s how the k-nearest algorithm works</strong>. When given a vector, it checks all neighbors around it up till a distance of ''k''. Within these neighbors, someone one label will have the maximum number of vectors.</p>
<p>For example, consider the ''0''s dashed vector above. Every neighbor till a distance of ''k'' has the label ''0''. So the given vector must be a zero too. Simple as that.</p>
<p>Similarly for 5''s dashed vector above. Neighbors till a distance of ''k'' are all labelled as ''5''. So the given vector is a 5. </p>
<h2>Deciding k in K-nearest neighbors</h2>
<p>Deciding a "good" k for your data is very important. If you choose a big K, you might end up including unwanted vectors in the neighborhood. If your K is very small, you might not have enough vector to correctly "identify" a label.</p>
<p>So how do you find a good k? Well, you use heuristics and find, by hit and trial, a decent value.</p>
<h2>Disadvantages of K-Nearest neighbors</h2>
<p>K-Nearest is the most simplest algorithm you can use for classifying things. It isn''t optimized for speed or space.</p>
<p>You need lots of training samples to ensure lots of vectors are withing the ''k'' sphere. And you need to have ALL training vectors in memory at all times. Then you compare a single test vector against LOTS of a training samples (to ensure they''re within the ''k'' sphere)/.</p>
<p>In short, its really slow and consumes a lot of memory. </p>
<h2>My results with K-Nearest Neighbors</h2>
<p>I used <a href="http://yann.lecun.com/exdb/mnist/">the MNIST handwritten digits dataset</a>. It has 60,000 training samples+labels and 10,000 test samples+labels. I varied the number of training samples given and checked the accuracy, memory used and time. Here are my results: </p>
<table>
<thead>
<tr>
<th>Training samples</th>
<th>Time to test 1000 samples (sec)</th>
<th>Memory used (KB)</th>
<th>Accuracy (%)</th>
</tr>
</thead>
<tbody>
<tr>
<td>100</td>
<td>1 s</td>
<td>4,328K</td>
<td>57.70 %</td>
</tr>
<tr>
<td>500</td>
<td>2 s</td>
<td>6,800K</td>
<td>75.50 %</td>
</tr>
<tr>
<td>1000</td>
<td>8 s</td>
<td>9,868K</td>
<td>81.50 %</td>
</tr>
<tr>
<td>5000</td>
<td>26 s</td>
<td>34,480 K</td>
<td>91.00 %</td>
</tr>
<tr>
<td>10000</td>
<td>88 s</td>
<td>65, 220 K</td>
<td>91.60 %</td>
</tr>
<tr>
<td>20000</td>
<td>173 s</td>
<td>128, 608 K</td>
<td>93.70 %</td>
</tr>
<tr>
<td>30000</td>
<td>254 s</td>
<td>188, 192 K</td>
<td>94.70 %</td>
</tr>
<tr>
<td>60000</td>
<td>311 s</td>
<td>372, 648 K</td>
<td>96.10 %</td>
</tr>
</tbody>
</table>
<p>That looks exponential! Not good! </p>
<figure><img alt="Time complexity and increasing accuracy" src="/static/img/tut/k-nearest-complexity.jpg" /><figcaption>
<p>Time complexity and increasing accuracy (Note that the horizontal axis is not linear)</p>
</figcaption>
</figure>
<h2>Summary</h2>
<p>K-Nearest Neighbour is a very simple machine learning algorithm. Its simplicity makes it slow and is a memory eating monster :P</p>','/static/img/tut/post-knearest.jpg','2010-10-01',1,6,'knearest-neighbours-classify-recognize-things');
INSERT INTO "aishack_tutorial" VALUES('Convolutions','',61,'<p>Convolutions is a technique for general signal processing. People studying electrical/electronics will tell you the near infinite sleepless nights these convolutions have given them. Entire books have been written on this topic. And the questions and theorems that need to be proved are [insurmountable]. But for computer vision, we''ll just deal with some simple things. </p>
<h2>The Kernel</h2>
<p>A convolution lets you do many things, like calculate derivatives, detect edges, apply blurs, etc. A very wide variety of things. And all of this is done with a "convolution kernel".</p>
<p>The convolution kernel is a small matrix. This matrix has numbers in each cell and has an anchor point: </p>
<p><img alt="The convolution kernel" src="/static/img/tut/conv-kernel.jpg" /></p>
<p>This kernel slides over an image and does its thing. The "anchor" point is used to determine the position of the kernel with respect to the image. </p>
<h2>The transformation</h2>
<p>The anchor point starts at the top-left corner of the image and moves over each pixel sequentially. At each position, the kernel overlaps a few pixels on the image. Each overlapping pair of numbers is multiplied and added. Finally, the value at the current position is set to this sum.</p>
<p>Here''s an example: </p>
<p><img alt="An example of the transformation" src="/static/img/tut/conv-transformation.jpg" /></p>
<p>The matrix on the left is the image and the one on the right is the kernel. Suppose the kernel is at the highlighted position. So the ''9'' of the kernel overlaps with the ''4'' of the image. So you calculate their product: 36. Next, ''3'' of the kernel overlaps the ''3'' of the image. So you multiply: 9. Then you add it to 36. So you get a sum of 36+9=45. Similarly, you do for all the remaining 7 overlapping values. You''ll get a total sum. This sum is stored in place of ''2'' (in the image). </p>
<h2>Speed optimizations</h2>
<p>The most direct way to compute a convolution would be to use multiple for loops. But that causes a lot of repeated calculations. And as the size of the image and kernel increases, the time to compute the convolution increases too (quite drastically).</p>
<p>Techniques haves been developed to calculate convolutions rapidly. One such technique is using the Discrete Fourier Transform. It converts the entire convolution operation into a simple multiplication. Fortunately, you don''t need to know the math to do this in OpenCV. It automatically decides whether to do it in frequency domain (after the DFT) or not. </p>
<h2>Problematic corners and edges</h2>
<p>The kernel is two dimensional. So you have problems when the kernel is near the edges or corners. Here''s an example: If the kernel (in the above example) is on the top right position, the ''0'' of the kernel will be over the ''3'' in the image. But the ''1'' will be outside the image. So we have no idea what to do with it. Two things are possible: </p>
<ul>
<li>Ignore the ones -or-</li>
<li>Do something about the edges
Usually people choose to do something about it. They create extra pixels near the edges. There are a few ways to create extra pixels: </li>
<li>Set a constant value for these pixels</li>
<li>Duplicate edge pixels</li>
<li>Reflect edges (like a mirror effect)</li>
<li>Warp the image around (copy pixels from the other end)</li>
</ul>
<p>This usually fixes the problems that might arise. </p>
<h2>Summary</h2>
<p>You learned a powerful technique that can be used for a lot of different purposes. We''ll see a few of those next.</p>','/static/img/tut/post-convolutions.jpg','2010-08-09',1,2,'convolutions');
INSERT INTO "aishack_tutorial" VALUES('Image convolution examples','',62,'<p>A convolution is very useful for signal processing in general. There is a lot of complex mathematical theory available for convolutions. For digital image processing, you don''t have to understand all of that. You can use a <a href="/tutorials/convolutions/">simple matrix as an image convolution kernel</a> and do some interesting things! </p>
<h2>Simple box blur</h2>
<p>Here''s a first and simplest. This convolution kernel has an averaging effect. So you end up with a slight blur. The image convolution kernel is:</p>
<p><img alt="The convolution kernel for a simple blur" src="/static/img/tut/conv-simple-blur.jpg" /></p>
<p>Note that the sum of all elements of this matrix is 1.0. This is important. If the sum is not exactly one, the resultant image will be brighter or darker.</p>
<p>Here''s a blur that I got on an image:</p>
<figure><img alt="After a simple blur done with a convolution" src="/static/img/tut/conv-simple-blur-result1.jpg" />  <figcaption>
<p>A simple blur done with convolutions  </p>
</figcaption>
</figure>
<h2>Gaussian blur</h2>
<p>Gaussian blur has certain mathematical properties that makes it important for computer vision. And you can approximate it with an image convolution. The image convolution kernel for a Gaussian blur is:</p>
<p><img alt="" src="/static/img/tut/conv-gaussian-blur.jpg" /></p>
<p>Here''s a result that I got:</p>
<p><img alt="Result of gaussian blur with a convolution" src="/static/img/tut/conv-gaussian-blur-result.jpg" /></p>
<h2>Line detection with image convolutions</h2>
<p>With image convolutions, you can easily detect lines. Here are four convolutions to detect horizontal, vertical and lines at 45 degrees:</p>
<p><img alt="Convolution kernels for line detection" src="/static/img/tut/conv-line-detection.jpg" />I looked for horizontal lines on the house image. The result I got for this image convolution was:</p>
<p><img alt="Detecting horizontal lines with a convolution" src="/static/img/tut/conv-line-detection-horizontal-result.jpg" /></p>
<h2>Edge detection</h2>
<p>The above kernels are in a way edge detectors. Only thing is that they have separate components for horizontal and vertical lines. A way to "combine" the results is to merge the convolution kernels. The new image convolution kernel looks like this:</p>
<p><img alt="The edge detection convolution kernel" src="/static/img/tut/conv-edge-detection.jpg" /></p>
<p>Below result I got with edge detection:</p>
<p><img alt="Edge detection with convolutions" src="/static/img/tut/conv-edge-detection-result.jpg" /></p>
<h2>The Sobel Edge Operator</h2>
<p>The above operators are very prone to noise. The Sobel edge operators have a smoothing effect, so they''re less affected to noise. Again, there''s a horizontal component and a vertical component.</p>
<p><img alt="The sobel operator''s convolution kernel" src="/static/img/tut/conv-sobel.jpg" /></p>
<p>On applying this image convolution, the result was:</p>
<p><img alt="Result of the horizontal sobel operator" src="/static/img/tut/conv-sobel-result.png" /></p>
<h2>The laplacian operator</h2>
<p>The laplacian is the second derivative of the image. It is extremely sensitive to noise, so it isn''t used as much as other operators. Unless, of course you have specific requirements.</p>
<p><img alt="The kernel for the laplacian operator" src="/static/img/tut/conv-laplacian.jpg" /></p>
<p>Here''s the result with the convolution kernel without diagonals:</p>
<p><img alt="The result of convolution with with the laplacian operator" src="/static/img/tut/conv-laplacian-result.png" /></p>
<h2>The Laplacian of Gaussian</h2>
<p>The laplacian alone has the disadvantage of being extremely sensitive to noise. So, smoothing the image before a laplacian improves the results we get. This is done with a 5x5 image convolution kernel.</p>
<p><img alt="The kernel for the laplacial of gaussian operation" src="/static/img/tut/conv-laplacian-of-gaussian.jpg" /></p>
<p>The result on applying this image convolution was:</p>
<p><img alt="The result of applying the laplacian of gaussian operator" src="/static/img/tut/conv-laplacian-of-gaussian-result.jpg" /></p>
<h2>Summary</h2>
<p>You got to know about some important operations that can be approximated using an image convolution. You learned the exact convolution kernels used and also saw an example of how each operator modifies an image. I hope this helped!</p>','/static/img/tut/post-convolutions.jpg','2010-08-16',1,2,'image-convolution-examples');
CREATE TABLE "aishack_tracktutorials" ("order" integer NOT NULL, "tutorial_id" integer NOT NULL, "id" integer PRIMARY KEY, "track_id" integer NOT NULL);
CREATE TABLE "aishack_aishackuser" ("website" varchar(200) NOT NULL, "short_bio" varchar(256) NOT NULL, "user_id" integer PRIMARY KEY, "bio" text NOT NULL);
INSERT INTO "aishack_aishackuser" VALUES('http://utkarshsinha.com/','<b>Utkarsh Sinha</b> created AI Shack in 2010 and has since been working on computer vision and related fields as a hobby! Currently he works as a writer of software in Bangalore, India.',1,'');
INSERT INTO "aishack_aishackuser" VALUES('','<strong>Shervin Emami</strong> has a Masters in Robotics Engineering and has worked in robotics, computer vision and electronics for over 13 years. He was born in Iran, grew up in Australia and has worked in USA, Abu Dhabi and Philippines.',2,'');
CREATE INDEX "django_admin_log_6340c63c" ON "django_admin_log" ("user_id");
CREATE INDEX "django_admin_log_37ef4eb4" ON "django_admin_log" ("content_type_id");
CREATE INDEX "auth_permission_37ef4eb4" ON "auth_permission" ("content_type_id");
CREATE INDEX "auth_group_permissions_5f412f9a" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_83d7f98b" ON "auth_group_permissions" ("permission_id");
CREATE INDEX "auth_user_groups_6340c63c" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_5f412f9a" ON "auth_user_groups" ("group_id");
CREATE INDEX "auth_user_user_permissions_6340c63c" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_83d7f98b" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_session_b7b81f0c" ON "django_session" ("expire_date");
CREATE INDEX "social_auth_usersocialauth_6340c63c" ON "social_auth_usersocialauth" ("user_id");
CREATE INDEX "social_auth_code_09bb5fb3" ON "social_auth_code" ("code");
CREATE INDEX "aishack_tutorial_6f33f001" ON "aishack_tutorial"("category_id");
CREATE INDEX "aishack_tracktutorials_54f593e2" ON "aishack_tracktutorials"("tutorial_id");
CREATE INDEX "aishack_tracktutorials_18c59dac" ON "aishack_tracktutorials"("track_id");
COMMIT;
