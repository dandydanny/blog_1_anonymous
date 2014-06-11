Blog 1: Anonymous Blog
======================

Using @DandyDanny's custom sinatra skeleton.

<h1 class='span8'>
Blog 1: Anonymous Blog
<small>Challenge</small>
</h1>
</div>
<div id='challenge_controls'>
<div class='row' style='min-height: 46px;'>
<div class='span2'>
<form accept-charset="UTF-8" action="/challenges/289/challenge_attempts" class="new_challenge_attempt" data-remote="true" id="new_challenge_attempt" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="YCHEYG2LcI8hRPCZLaeQOb6pKfrSue6TsxZTng88T3Q=" /></div><input class="btn btn-success challenge-button" data-disable-text="Creating repo..." name="commit" type="submit" value="Start Challenge" />
</form>

</div>

<div class='span8'>
</div>
</div>
<div class='row'>
<div class='alert alert-success span9' id='notice' style='display: none'></div>
</div>

</div>
<ul class='nav nav-tabs'>
<li class='active'><a data-toggle='tab' href='#objectives'>
Objectives
</a></li>
<li><a data-toggle='tab' href='#comments'>
Comments
</a></li>
</ul>
<div class='tab-content'>
<div class='tab-pane active' id='objectives'>
<p>We&#39;re going to write a simple homepage with a blog.  This will be our first many-to-many relationship inside the context of Sinatra.  Later, we&#39;ll integrate user authentication.</p>

<p>Do the <a href="/challenges/279">Sinatra sandbox challenge</a> first if you don&#39;t feel comfortable with the flow of a web application or how forms send data to the server.</p>

<p>We&#39;ll have two core models: posts and tags.  A post can have many tags and a tag can be on many posts.</p>

<p>Here is our trusty <a href="http://cl.ly/2n3D2V0R0L2f">sinatra skeleton for you to use</a>.</p>

<h2 id="toc_0">Learning Goals</h2>

<ul>
<li>Many-to-many associations in ActiveRecord.</li>
<li>How to use multiple files for controller routes.</li>
<li>ActiveRecord validations.</li>
</ul>

<h2 id="toc_1">Objectives</h2>

<h3 id="toc_2">Controllers &amp; Routes</h3>

<p>Think about your controllers and routes.  Consider making three controller files:</p>

<ol>
<li><code>app/controllers/index.rb</code></li>
<li><code>app/controllers/posts.rb</code></li>
<li><code>app/controllers/tags.rb</code></li>
</ol>

<p>The <code>index</code> controller will just have the index route, displaying your homepage.  All <code>Post</code>-related routes will go in the <code>posts</code> controller and all <code>Tag</code>-related routes will go in the <code>tags</code> controller.</p>

<p>These are the operations we want to support for posts:</p>

<ol>
<li>Show me all posts</li>
<li>Show me a particular post</li>
<li>Create a new post</li>
<li>Edit an existing post</li>
<li>Delete an existing post</li>
</ol>

<p>These are the operations we want to support for tags:</p>

<ol>
<li>Show me all posts with a given tag</li>
</ol>

<p>Tags will be created via the <code>Post</code>-creation form.</p>

<h3 id="toc_3">Models &amp; Validations</h3>

<p>Create all the necessary models and migrations to support the above.  You should have three models &mdash; what are they?</p>

<p>Add the appropriate validations to your models.  Read the <a href="http://guides.rubyonrails.org/active_record_validations_callbacks.html">Rails guide to ActiveRecord validations</a> for reference.</p>

<p>For example, if your <code>Post</code> model has <code>body</code> and <code>title</code> fields, you probably don&#39;t want to permit a <code>Post</code> that has no <code>body</code> or <code>title</code> to be saved to the database.  This means adding <code>NOT NULL</code> constraints to the migrations and the following validations to your ActiveRecord model:</p>
<div class="highlight"><pre><span class="k">class</span> <span class="nc">Post</span> <span class="o">&lt;</span> <span class="no">ActiveRecord</span><span class="o">::</span><span class="no">Base</span>
  <span class="n">validates</span> <span class="ss">:body</span><span class="p">,</span> <span class="ss">:presence</span> <span class="o">=&gt;</span> <span class="kp">true</span>
  <span class="n">validates</span> <span class="ss">:title</span><span class="p">,</span> <span class="ss">:presence</span> <span class="o">=&gt;</span> <span class="kp">true</span>
<span class="k">end</span>
</pre></div>
<p>You&#39;ll have other fields and validations, to be sure.  What fields do you want your blog post to have?  Author?</p>

<h3 id="toc_4">Design Simple Pages and Forms</h3>

<p>Design simple pages and forms to implement all the above functionality.  It doesn&#39;t need to be styled well, but if your HTML is well-structured it will make it easier to style later.</p>

<p>Your forms for creating and updating <code>Post</code> models should allow you to enter tags.  You can decide how that works, although from a user experience perspective it would be incredibly tedious to have to create tags elsewhere before a post author can use them.  However, if a post author uses a tag that already exists, you aren&#39;t going to want to create a new row in the <code>tags</code> table, but rather re-use the already-existing tag.</p>

<p>One idea might be to permit them to enter tags like this:</p>
<div class="highlight"><pre><span class="nt">&lt;label</span> <span class="na">for=</span><span class="s">&quot;post_tags&quot;</span><span class="nt">&gt;</span>Tags:<span class="nt">&lt;/label&gt;</span>
<span class="nt">&lt;input</span> <span class="na">id=</span><span class="s">&quot;post_tags&quot;</span> <span class="na">name=</span><span class="s">&quot;post[tags]&quot;</span> <span class="na">value=</span><span class="s">&quot;tag1, tag2, some other tag, a fourth tag&quot;</span><span class="nt">&gt;</span>
</pre></div>
<p>which renders as:</p>

<p><label for="post_tags">Tags:</label>
<input id="post_tags" name="post[tags]" value="tag1, tag2, some other tag, a fourth tag" class="span4"></p>

<p>All your routes should now implement their basic functionality.  You should be able to list, show, create, update, and delete posts.  You should also be able to see all posts for a given tag at a url like</p>
<div class="highlight"><pre>http://localhost:9393/tag/apple
</pre></div>
<h3 id="toc_5">Error Cases</h3>

<p>Using <a href="http://guides.rubyonrails.org/active_record_validations_callbacks.html#valid-and-invalid">valid? and invalid?</a> and the <a href="http://guides.rubyonrails.org/active_record_validations_callbacks.html#validations_overview-errors">errors</a> methods, make sure you&#39;re handling your error cases gracefully.  It doesn&#39;t need to be perfect, but good error handling means:</p>

<ol>
<li>When a user makes a mistake or breaks some rule, they&#39;re informed</li>
<li>The user is presented with an opportunity to correct the mistake, if possible</li>
<li>The user is given as much guidance as possible about that they need to do to fix the error</li>
</ol>

<h3 id="toc_6">Style!  Style!  Style!</h3>

<p>You might want to do the <a href="http://socrates.devbootcamp.com/challenges/286">Layout Drill: Proper Typesetting</a> first, if you haven&#39;t.  But following the guidelines from that challenge, spruce up your blog design.</p>

<p>If you have time, try to make it something you&#39;re proud to look at.</p>
