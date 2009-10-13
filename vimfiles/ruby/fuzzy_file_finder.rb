
  

  


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
        <title>lib/fuzzy_file_finder.rb at master from jamis's fuzzy_file_finder - GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="http://github.com/fluidicon.png" title="GitHub" />

    
      <link href="http://assets0.github.com/stylesheets/bundle.css?558f5c2a10480fade1bcff619f06c59239d95ba8" media="screen" rel="stylesheet" type="text/css" />
    

    
      
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <script src="http://assets3.github.com/javascripts/bundle.js?558f5c2a10480fade1bcff619f06c59239d95ba8" type="text/javascript"></script>
      
    
    
  
    
  

  <link href="http://github.com/feeds/jamis/commits/fuzzy_file_finder/master" rel="alternate" title="Recent Commits to fuzzy_file_finder:master" type="application/atom+xml" />

        <meta name="description" content="A (slightly enhanced) implementation of TextMate's cmd-T lookup functionality, in Ruby, for embedding in other projects" />
    <script type="text/javascript">
      GitHub.nameWithOwner = GitHub.nameWithOwner || "jamis/fuzzy_file_finder";
      GitHub.currentRef = "master";    
    </script>
  

    

    <script type="text/javascript">
      github_user = null
    </script>
  </head>

  

  <body>
    

    <div id="main">
      <div id="header" class="">
        <div class="site">
          <div class="logo">
            <a href="http://github.com"><img src="/images/modules/header/logov3.png" alt="github" /></a>
          </div>
          
          <div class="topsearch">
  
    <form action="/search" id="top_search_form" method="get">
      <a href="/search" class="advanced-search" title="Advanced Search">Advanced Search</a>
      <input type="search" class="search repo_autocompleter" name="q" results="5" placeholder="Search GitHub&hellip;" /> <input type="submit" value="Search", class="button" />
      <input type="hidden" name="type" value="Everything" />
      <input type="hidden" name="repo" value="" />
      <input type="hidden" name="langOverride" value="" />
      <input type="hidden" name="start_value" value="1" />
    </form>
  
  
    <ul class="nav logged_out">
      
        <li><a href="http://github.com">Home</a></li>
        <li class="pricing"><a href="/plans">Pricing and Signup</a></li>
        <li><a href="http://github.com/popular/forked">Explore GitHub</a></li>
        
        <li><a href="/blog">Blog</a></li>
      
      <li><a href="https://github.com/login">Login</a></li>
    </ul>
  
</div>
        </div>
      </div>

      
        
      <div id="repo_menu">
        <div class="site">
          <ul>
            
              <li class="active"><a href="http://github.com/jamis/fuzzy_file_finder/tree/master">Source</a></li>

              <li class=""><a href="http://github.com/jamis/fuzzy_file_finder/commits/master">Commits</a></li>

              
              <li class=""><a href="/jamis/fuzzy_file_finder/network">Network (11)</a></li>

              

              
                
                <li class=""><a href="/jamis/fuzzy_file_finder/issues">Issues (1)</a></li>
              

              
                
                <li class=""><a href="/jamis/fuzzy_file_finder/downloads">Downloads (0)</a></li>
              

              
                
                <li class=""><a href="http://wiki.github.com/jamis/fuzzy_file_finder">Wiki (1)</a></li>
              

              <li class=""><a href="/jamis/fuzzy_file_finder/graphs">Graphs</a></li>

              

            
          </ul>
        </div>
      </div>

    <div id="repo_sub_menu">
      <div class="site">
        <div class="joiner"></div>
        

        

        

        
      </div>
    </div>

    <div class="site">
      





<div id="repos">
  


<script type="text/javascript">
  GitHub.currentCommitRef = "master"
  GitHub.currentRepoOwner = "jamis"
  GitHub.currentRepo = "fuzzy_file_finder"
  
</script>



  <div class="repo public" id="repo_details">
    <div class="title">
      <div class="path">
        <a href="/jamis">jamis</a> / <b><a href="http://github.com/jamis/fuzzy_file_finder">fuzzy_file_finder</a></b>

        

          <span id="edit_button" style="display:none;">
            <a href="/jamis/fuzzy_file_finder/edit"><img alt="edit" class="button" src="http://assets0.github.com/images/modules/repos/edit_button.png?558f5c2a10480fade1bcff619f06c59239d95ba8" /></a>
          </span>

          
            <span id="pull_request_button" style="display:none;">
              <a href="/jamis/fuzzy_file_finder/pull_request/" class="pull_request_button"><img alt="pull request" class="button" src="http://assets3.github.com/images/modules/repos/pull_request_button.png?558f5c2a10480fade1bcff619f06c59239d95ba8" /></a>
            </span>

            <span id="fork_button">
              <form method="POST" action="/jamis/fuzzy_file_finder/fork" style="display:inline;">
                <input alt="fork" class="button" src="http://assets3.github.com/images/modules/repos/fork_button.png?558f5c2a10480fade1bcff619f06c59239d95ba8" type="image" />
              </form>
            </span>
          

          <span id="watch_button">
            <a href="/jamis/fuzzy_file_finder/toggle_watch" class="toggle_watch"><img alt="watch" class="button" src="http://assets3.github.com/images/modules/repos/watch_button.png?558f5c2a10480fade1bcff619f06c59239d95ba8" /></a>
          </span>

          <span id="unwatch_button" style="display:none;">
            <a href="/jamis/fuzzy_file_finder/toggle_watch" class="toggle_watch"><img alt="watch" class="button" src="http://assets2.github.com/images/modules/repos/unwatch_button.png?558f5c2a10480fade1bcff619f06c59239d95ba8" /></a>
          </span>

          
            <a href="/jamis/fuzzy_file_finder/archives/a3e4b2a199314b337908a866e6da896bb003171c" id="download_button">
              <img alt="download tarball" class="button" src="http://assets2.github.com/images/modules/repos/download_button.png?558f5c2a10480fade1bcff619f06c59239d95ba8" />
            </a>
          
        
      </div>

      <div class="security private_security" style="display:none">
        <a href="#private_repo" rel="facebox"><img src="/images/icons/private.png" alt="private" /></a>
      </div>

      <div id="private_repo" class="hidden">
        This repository is private.
        All pages are served over SSL and all pushing and pulling is done over SSH.
        No one may fork, clone, or view it unless they are added as a <a href="/jamis/fuzzy_file_finder/edit">member</a>.

        <br/>
        <br/>
        Every repository with this icon (<img src="/images/icons/private.png" alt="private" />) is private.
      </div>

      <div class="security public_security" style="">
        <a href="#public_repo" rel="facebox"><img src="/images/icons/public.png" alt="public" /></a>
      </div>

      <div id="public_repo" class="hidden">
        This repository is public.
        Anyone may fork, clone, or view it.

        <br/>
        <br/>
        Every repository with this icon (<img src="/images/icons/public.png" alt="public" />) is public.
      </div>

      

        <div class="flexipill">
          <a href="/jamis/fuzzy_file_finder/network">
          <table cellpadding="0" cellspacing="0">
            <tr><td><img alt="Forks" src="http://assets0.github.com/images/modules/repos/pills/forks.png?558f5c2a10480fade1bcff619f06c59239d95ba8" /></td><td class="middle"><span>11</span></td><td><img alt="Right" src="http://assets1.github.com/images/modules/repos/pills/right.png?558f5c2a10480fade1bcff619f06c59239d95ba8" /></td></tr>
          </table>
          </a>
        </div>

        <div class="flexipill">
          <a href="/jamis/fuzzy_file_finder/watchers">
          <table cellpadding="0" cellspacing="0">
            <tr><td><img alt="Watchers" src="http://assets0.github.com/images/modules/repos/pills/watchers.png?558f5c2a10480fade1bcff619f06c59239d95ba8" /></td><td class="middle"><span>97</span></td><td><img alt="Right" src="http://assets1.github.com/images/modules/repos/pills/right.png?558f5c2a10480fade1bcff619f06c59239d95ba8" /></td></tr>
          </table>
          </a>
        </div>
      </div>

    <div class="meta">
      <table>
        
        <tr>
          <td class="label">Description:</td>
          <td>
            <span id="repository_description" rel="/jamis/fuzzy_file_finder/edit/update">A (slightly enhanced) implementation of TextMate's cmd-T lookup functionality, in Ruby, for embedding in other projects</span>
            <a href="#description" class="edit_link action" style="display:none;">edit</a>
          </td>
        </tr>

        
            <tr>
              <td class="label">Homepage:</td>
              <td>
                
                <span id="repository_homepage" rel="/jamis/fuzzy_file_finder/edit/update">
                  <a href="http://"></a>
                </span>
                <a href="#homepage" class="edit_link action" style="display:none;">edit</a>
              </td>
            </tr>

          
            <tr>
              <td class="label"><span id="public_clone_text" style="display:none;">Public&nbsp;</span>Clone&nbsp;URL:</td>
              
              <td>
                <a href="git://github.com/jamis/fuzzy_file_finder.git" class="git_url_facebox" rel="#git-clone">git://github.com/jamis/fuzzy_file_finder.git</a>
                      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
              width="110"
              height="14"
              class="clippy"
              id="clippy" >
      <param name="movie" value="/flash/clippy.swf"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="text=git://github.com/jamis/fuzzy_file_finder.git">
      <param name="bgcolor" value="#F0F0F0">
      <param name="wmode" value="opaque">
      <embed src="/flash/clippy.swf"
             width="110"
             height="14"
             name="clippy"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="text=git://github.com/jamis/fuzzy_file_finder.git"
             bgcolor="#F0F0F0"
             wmode="opaque"
      />
      </object>

                <div id="git-clone" style="display:none;">
                  Give this clone URL to anyone.
                  <br/>
                  <code>git clone git://github.com/jamis/fuzzy_file_finder.git </code>
                </div>
              </td>
            </tr>
          

          <tr id="private_clone_url" style="display:none;">
            <td class="label">Your Clone URL:</td>
            
            <td>

              <div id="private-clone-url">
                <a href="git@github.com:jamis/fuzzy_file_finder.git" class="git_url_facebox" rel="#your-git-clone">git@github.com:jamis/fuzzy_file_finder.git</a>
                <input type="text" value="git@github.com:jamis/fuzzy_file_finder.git" style="display: none;" />
                      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
              width="110"
              height="14"
              class="clippy"
              id="clippy" >
      <param name="movie" value="/flash/clippy.swf"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="text=git@github.com:jamis/fuzzy_file_finder.git">
      <param name="bgcolor" value="#F0F0F0">
      <param name="wmode" value="opaque">
      <embed src="/flash/clippy.swf"
             width="110"
             height="14"
             name="clippy"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="text=git@github.com:jamis/fuzzy_file_finder.git"
             bgcolor="#F0F0F0"
             wmode="opaque"
      />
      </object>

              </div>

              <div id="your-git-clone" style="display:none;">
                Use this clone URL yourself.
                <br/>
                <code>git clone git@github.com:jamis/fuzzy_file_finder.git </code>
              </div>
            </td>
          </tr>

          

          

          
      </table>

      
        <div class="pledgie">
          <a href='http://pledgie.com/campaigns/1806'><img alt='Click here to lend your support to: fuzzy_file_finder and make a donation at www.pledgie.com !' src='http://www.pledgie.com/campaigns/1806.png?skin_name=chrome' border='0' /></a>
        </div>
          </div>
  </div>






</div>


  <div id="commit">
    <div class="group">
        
  <div class="envelope commit">
    <div class="human">
      
        <div class="message"><pre><a href="/jamis/fuzzy_file_finder/commit/f645acebfad05c339ba14296da1f9b2a1d867580">Changing pattern strip to substitution so that all spaces are removed from 
the pattern</a> </pre></div>
      

      <div class="actor">
        <div class="gravatar">
          
          <img alt="" height="30" src="http://www.gravatar.com/avatar/7378029a6f02a77fa64aee11fc46af16?s=30&amp;d=http%3A%2F%2Fgithub.com%2Fimages%2Fgravatars%2Fgravatar-30.png" width="30" />
        </div>
        <div class="name">Matt Baron <span>(author)</span></div>
          <div class="date">
            <abbr class="relatize" title="2008-12-31 10:44:55">Wed Dec 31 10:44:55 -0800 2008</abbr> 
          </div>
      </div>
  
      
  
    </div>
    <div class="machine">
      <span>c</span>ommit&nbsp;&nbsp;<a href="/jamis/fuzzy_file_finder/commit/f645acebfad05c339ba14296da1f9b2a1d867580" hotkey="c">f645acebfad05c339ba14296da1f9b2a1d867580</a><br />
      <span>t</span>ree&nbsp;&nbsp;&nbsp;&nbsp;<a href="/jamis/fuzzy_file_finder/tree/f645acebfad05c339ba14296da1f9b2a1d867580" hotkey="t">04a4e7500fd4c5956f5c3283c75387357c4b3697</a><br />
  
      
        <span>p</span>arent&nbsp;
        
        <a href="/jamis/fuzzy_file_finder/tree/6328948cbeed388d0f8dd10f28c468b109840926" hotkey="p">6328948cbeed388d0f8dd10f28c468b109840926</a>
      
  
    </div>
  </div>

    </div>
  </div>



  
    <div id="path">
      <b><a href="/jamis/fuzzy_file_finder/tree/master">fuzzy_file_finder</a></b> / <a href="/jamis/fuzzy_file_finder/tree/master/lib">lib</a> / fuzzy_file_finder.rb       <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
              width="110"
              height="14"
              class="clippy"
              id="clippy" >
      <param name="movie" value="/flash/clippy.swf"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="text=lib/fuzzy_file_finder.rb">
      <param name="bgcolor" value="#FFFFFF">
      <param name="wmode" value="opaque">
      <embed src="/flash/clippy.swf"
             width="110"
             height="14"
             name="clippy"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="text=lib/fuzzy_file_finder.rb"
             bgcolor="#FFFFFF"
             wmode="opaque"
      />
      </object>

    </div>

    <div id="files">
      <div class="file">
        <div class="meta">
          <div class="info">
            <span>100644</span>
            <span>354 lines (299 sloc)</span>
            <span>12.249 kb</span>
          </div>
          <div class="actions">
            
            <a href="/jamis/fuzzy_file_finder/raw/master/lib/fuzzy_file_finder.rb" id="raw-url">raw</a>
            
              <a href="/jamis/fuzzy_file_finder/blame/master/lib/fuzzy_file_finder.rb">blame</a>
            
            <a href="/jamis/fuzzy_file_finder/commits/master/lib/fuzzy_file_finder.rb">history</a>
          </div>
        </div>
        
  <div class="data syntax">
    
      <table cellpadding="0" cellspacing="0">
        <tr>
          <td>
            
            <pre class="line_numbers">
<span id="LID1" rel="#L1">1</span>
<span id="LID2" rel="#L2">2</span>
<span id="LID3" rel="#L3">3</span>
<span id="LID4" rel="#L4">4</span>
<span id="LID5" rel="#L5">5</span>
<span id="LID6" rel="#L6">6</span>
<span id="LID7" rel="#L7">7</span>
<span id="LID8" rel="#L8">8</span>
<span id="LID9" rel="#L9">9</span>
<span id="LID10" rel="#L10">10</span>
<span id="LID11" rel="#L11">11</span>
<span id="LID12" rel="#L12">12</span>
<span id="LID13" rel="#L13">13</span>
<span id="LID14" rel="#L14">14</span>
<span id="LID15" rel="#L15">15</span>
<span id="LID16" rel="#L16">16</span>
<span id="LID17" rel="#L17">17</span>
<span id="LID18" rel="#L18">18</span>
<span id="LID19" rel="#L19">19</span>
<span id="LID20" rel="#L20">20</span>
<span id="LID21" rel="#L21">21</span>
<span id="LID22" rel="#L22">22</span>
<span id="LID23" rel="#L23">23</span>
<span id="LID24" rel="#L24">24</span>
<span id="LID25" rel="#L25">25</span>
<span id="LID26" rel="#L26">26</span>
<span id="LID27" rel="#L27">27</span>
<span id="LID28" rel="#L28">28</span>
<span id="LID29" rel="#L29">29</span>
<span id="LID30" rel="#L30">30</span>
<span id="LID31" rel="#L31">31</span>
<span id="LID32" rel="#L32">32</span>
<span id="LID33" rel="#L33">33</span>
<span id="LID34" rel="#L34">34</span>
<span id="LID35" rel="#L35">35</span>
<span id="LID36" rel="#L36">36</span>
<span id="LID37" rel="#L37">37</span>
<span id="LID38" rel="#L38">38</span>
<span id="LID39" rel="#L39">39</span>
<span id="LID40" rel="#L40">40</span>
<span id="LID41" rel="#L41">41</span>
<span id="LID42" rel="#L42">42</span>
<span id="LID43" rel="#L43">43</span>
<span id="LID44" rel="#L44">44</span>
<span id="LID45" rel="#L45">45</span>
<span id="LID46" rel="#L46">46</span>
<span id="LID47" rel="#L47">47</span>
<span id="LID48" rel="#L48">48</span>
<span id="LID49" rel="#L49">49</span>
<span id="LID50" rel="#L50">50</span>
<span id="LID51" rel="#L51">51</span>
<span id="LID52" rel="#L52">52</span>
<span id="LID53" rel="#L53">53</span>
<span id="LID54" rel="#L54">54</span>
<span id="LID55" rel="#L55">55</span>
<span id="LID56" rel="#L56">56</span>
<span id="LID57" rel="#L57">57</span>
<span id="LID58" rel="#L58">58</span>
<span id="LID59" rel="#L59">59</span>
<span id="LID60" rel="#L60">60</span>
<span id="LID61" rel="#L61">61</span>
<span id="LID62" rel="#L62">62</span>
<span id="LID63" rel="#L63">63</span>
<span id="LID64" rel="#L64">64</span>
<span id="LID65" rel="#L65">65</span>
<span id="LID66" rel="#L66">66</span>
<span id="LID67" rel="#L67">67</span>
<span id="LID68" rel="#L68">68</span>
<span id="LID69" rel="#L69">69</span>
<span id="LID70" rel="#L70">70</span>
<span id="LID71" rel="#L71">71</span>
<span id="LID72" rel="#L72">72</span>
<span id="LID73" rel="#L73">73</span>
<span id="LID74" rel="#L74">74</span>
<span id="LID75" rel="#L75">75</span>
<span id="LID76" rel="#L76">76</span>
<span id="LID77" rel="#L77">77</span>
<span id="LID78" rel="#L78">78</span>
<span id="LID79" rel="#L79">79</span>
<span id="LID80" rel="#L80">80</span>
<span id="LID81" rel="#L81">81</span>
<span id="LID82" rel="#L82">82</span>
<span id="LID83" rel="#L83">83</span>
<span id="LID84" rel="#L84">84</span>
<span id="LID85" rel="#L85">85</span>
<span id="LID86" rel="#L86">86</span>
<span id="LID87" rel="#L87">87</span>
<span id="LID88" rel="#L88">88</span>
<span id="LID89" rel="#L89">89</span>
<span id="LID90" rel="#L90">90</span>
<span id="LID91" rel="#L91">91</span>
<span id="LID92" rel="#L92">92</span>
<span id="LID93" rel="#L93">93</span>
<span id="LID94" rel="#L94">94</span>
<span id="LID95" rel="#L95">95</span>
<span id="LID96" rel="#L96">96</span>
<span id="LID97" rel="#L97">97</span>
<span id="LID98" rel="#L98">98</span>
<span id="LID99" rel="#L99">99</span>
<span id="LID100" rel="#L100">100</span>
<span id="LID101" rel="#L101">101</span>
<span id="LID102" rel="#L102">102</span>
<span id="LID103" rel="#L103">103</span>
<span id="LID104" rel="#L104">104</span>
<span id="LID105" rel="#L105">105</span>
<span id="LID106" rel="#L106">106</span>
<span id="LID107" rel="#L107">107</span>
<span id="LID108" rel="#L108">108</span>
<span id="LID109" rel="#L109">109</span>
<span id="LID110" rel="#L110">110</span>
<span id="LID111" rel="#L111">111</span>
<span id="LID112" rel="#L112">112</span>
<span id="LID113" rel="#L113">113</span>
<span id="LID114" rel="#L114">114</span>
<span id="LID115" rel="#L115">115</span>
<span id="LID116" rel="#L116">116</span>
<span id="LID117" rel="#L117">117</span>
<span id="LID118" rel="#L118">118</span>
<span id="LID119" rel="#L119">119</span>
<span id="LID120" rel="#L120">120</span>
<span id="LID121" rel="#L121">121</span>
<span id="LID122" rel="#L122">122</span>
<span id="LID123" rel="#L123">123</span>
<span id="LID124" rel="#L124">124</span>
<span id="LID125" rel="#L125">125</span>
<span id="LID126" rel="#L126">126</span>
<span id="LID127" rel="#L127">127</span>
<span id="LID128" rel="#L128">128</span>
<span id="LID129" rel="#L129">129</span>
<span id="LID130" rel="#L130">130</span>
<span id="LID131" rel="#L131">131</span>
<span id="LID132" rel="#L132">132</span>
<span id="LID133" rel="#L133">133</span>
<span id="LID134" rel="#L134">134</span>
<span id="LID135" rel="#L135">135</span>
<span id="LID136" rel="#L136">136</span>
<span id="LID137" rel="#L137">137</span>
<span id="LID138" rel="#L138">138</span>
<span id="LID139" rel="#L139">139</span>
<span id="LID140" rel="#L140">140</span>
<span id="LID141" rel="#L141">141</span>
<span id="LID142" rel="#L142">142</span>
<span id="LID143" rel="#L143">143</span>
<span id="LID144" rel="#L144">144</span>
<span id="LID145" rel="#L145">145</span>
<span id="LID146" rel="#L146">146</span>
<span id="LID147" rel="#L147">147</span>
<span id="LID148" rel="#L148">148</span>
<span id="LID149" rel="#L149">149</span>
<span id="LID150" rel="#L150">150</span>
<span id="LID151" rel="#L151">151</span>
<span id="LID152" rel="#L152">152</span>
<span id="LID153" rel="#L153">153</span>
<span id="LID154" rel="#L154">154</span>
<span id="LID155" rel="#L155">155</span>
<span id="LID156" rel="#L156">156</span>
<span id="LID157" rel="#L157">157</span>
<span id="LID158" rel="#L158">158</span>
<span id="LID159" rel="#L159">159</span>
<span id="LID160" rel="#L160">160</span>
<span id="LID161" rel="#L161">161</span>
<span id="LID162" rel="#L162">162</span>
<span id="LID163" rel="#L163">163</span>
<span id="LID164" rel="#L164">164</span>
<span id="LID165" rel="#L165">165</span>
<span id="LID166" rel="#L166">166</span>
<span id="LID167" rel="#L167">167</span>
<span id="LID168" rel="#L168">168</span>
<span id="LID169" rel="#L169">169</span>
<span id="LID170" rel="#L170">170</span>
<span id="LID171" rel="#L171">171</span>
<span id="LID172" rel="#L172">172</span>
<span id="LID173" rel="#L173">173</span>
<span id="LID174" rel="#L174">174</span>
<span id="LID175" rel="#L175">175</span>
<span id="LID176" rel="#L176">176</span>
<span id="LID177" rel="#L177">177</span>
<span id="LID178" rel="#L178">178</span>
<span id="LID179" rel="#L179">179</span>
<span id="LID180" rel="#L180">180</span>
<span id="LID181" rel="#L181">181</span>
<span id="LID182" rel="#L182">182</span>
<span id="LID183" rel="#L183">183</span>
<span id="LID184" rel="#L184">184</span>
<span id="LID185" rel="#L185">185</span>
<span id="LID186" rel="#L186">186</span>
<span id="LID187" rel="#L187">187</span>
<span id="LID188" rel="#L188">188</span>
<span id="LID189" rel="#L189">189</span>
<span id="LID190" rel="#L190">190</span>
<span id="LID191" rel="#L191">191</span>
<span id="LID192" rel="#L192">192</span>
<span id="LID193" rel="#L193">193</span>
<span id="LID194" rel="#L194">194</span>
<span id="LID195" rel="#L195">195</span>
<span id="LID196" rel="#L196">196</span>
<span id="LID197" rel="#L197">197</span>
<span id="LID198" rel="#L198">198</span>
<span id="LID199" rel="#L199">199</span>
<span id="LID200" rel="#L200">200</span>
<span id="LID201" rel="#L201">201</span>
<span id="LID202" rel="#L202">202</span>
<span id="LID203" rel="#L203">203</span>
<span id="LID204" rel="#L204">204</span>
<span id="LID205" rel="#L205">205</span>
<span id="LID206" rel="#L206">206</span>
<span id="LID207" rel="#L207">207</span>
<span id="LID208" rel="#L208">208</span>
<span id="LID209" rel="#L209">209</span>
<span id="LID210" rel="#L210">210</span>
<span id="LID211" rel="#L211">211</span>
<span id="LID212" rel="#L212">212</span>
<span id="LID213" rel="#L213">213</span>
<span id="LID214" rel="#L214">214</span>
<span id="LID215" rel="#L215">215</span>
<span id="LID216" rel="#L216">216</span>
<span id="LID217" rel="#L217">217</span>
<span id="LID218" rel="#L218">218</span>
<span id="LID219" rel="#L219">219</span>
<span id="LID220" rel="#L220">220</span>
<span id="LID221" rel="#L221">221</span>
<span id="LID222" rel="#L222">222</span>
<span id="LID223" rel="#L223">223</span>
<span id="LID224" rel="#L224">224</span>
<span id="LID225" rel="#L225">225</span>
<span id="LID226" rel="#L226">226</span>
<span id="LID227" rel="#L227">227</span>
<span id="LID228" rel="#L228">228</span>
<span id="LID229" rel="#L229">229</span>
<span id="LID230" rel="#L230">230</span>
<span id="LID231" rel="#L231">231</span>
<span id="LID232" rel="#L232">232</span>
<span id="LID233" rel="#L233">233</span>
<span id="LID234" rel="#L234">234</span>
<span id="LID235" rel="#L235">235</span>
<span id="LID236" rel="#L236">236</span>
<span id="LID237" rel="#L237">237</span>
<span id="LID238" rel="#L238">238</span>
<span id="LID239" rel="#L239">239</span>
<span id="LID240" rel="#L240">240</span>
<span id="LID241" rel="#L241">241</span>
<span id="LID242" rel="#L242">242</span>
<span id="LID243" rel="#L243">243</span>
<span id="LID244" rel="#L244">244</span>
<span id="LID245" rel="#L245">245</span>
<span id="LID246" rel="#L246">246</span>
<span id="LID247" rel="#L247">247</span>
<span id="LID248" rel="#L248">248</span>
<span id="LID249" rel="#L249">249</span>
<span id="LID250" rel="#L250">250</span>
<span id="LID251" rel="#L251">251</span>
<span id="LID252" rel="#L252">252</span>
<span id="LID253" rel="#L253">253</span>
<span id="LID254" rel="#L254">254</span>
<span id="LID255" rel="#L255">255</span>
<span id="LID256" rel="#L256">256</span>
<span id="LID257" rel="#L257">257</span>
<span id="LID258" rel="#L258">258</span>
<span id="LID259" rel="#L259">259</span>
<span id="LID260" rel="#L260">260</span>
<span id="LID261" rel="#L261">261</span>
<span id="LID262" rel="#L262">262</span>
<span id="LID263" rel="#L263">263</span>
<span id="LID264" rel="#L264">264</span>
<span id="LID265" rel="#L265">265</span>
<span id="LID266" rel="#L266">266</span>
<span id="LID267" rel="#L267">267</span>
<span id="LID268" rel="#L268">268</span>
<span id="LID269" rel="#L269">269</span>
<span id="LID270" rel="#L270">270</span>
<span id="LID271" rel="#L271">271</span>
<span id="LID272" rel="#L272">272</span>
<span id="LID273" rel="#L273">273</span>
<span id="LID274" rel="#L274">274</span>
<span id="LID275" rel="#L275">275</span>
<span id="LID276" rel="#L276">276</span>
<span id="LID277" rel="#L277">277</span>
<span id="LID278" rel="#L278">278</span>
<span id="LID279" rel="#L279">279</span>
<span id="LID280" rel="#L280">280</span>
<span id="LID281" rel="#L281">281</span>
<span id="LID282" rel="#L282">282</span>
<span id="LID283" rel="#L283">283</span>
<span id="LID284" rel="#L284">284</span>
<span id="LID285" rel="#L285">285</span>
<span id="LID286" rel="#L286">286</span>
<span id="LID287" rel="#L287">287</span>
<span id="LID288" rel="#L288">288</span>
<span id="LID289" rel="#L289">289</span>
<span id="LID290" rel="#L290">290</span>
<span id="LID291" rel="#L291">291</span>
<span id="LID292" rel="#L292">292</span>
<span id="LID293" rel="#L293">293</span>
<span id="LID294" rel="#L294">294</span>
<span id="LID295" rel="#L295">295</span>
<span id="LID296" rel="#L296">296</span>
<span id="LID297" rel="#L297">297</span>
<span id="LID298" rel="#L298">298</span>
<span id="LID299" rel="#L299">299</span>
<span id="LID300" rel="#L300">300</span>
<span id="LID301" rel="#L301">301</span>
<span id="LID302" rel="#L302">302</span>
<span id="LID303" rel="#L303">303</span>
<span id="LID304" rel="#L304">304</span>
<span id="LID305" rel="#L305">305</span>
<span id="LID306" rel="#L306">306</span>
<span id="LID307" rel="#L307">307</span>
<span id="LID308" rel="#L308">308</span>
<span id="LID309" rel="#L309">309</span>
<span id="LID310" rel="#L310">310</span>
<span id="LID311" rel="#L311">311</span>
<span id="LID312" rel="#L312">312</span>
<span id="LID313" rel="#L313">313</span>
<span id="LID314" rel="#L314">314</span>
<span id="LID315" rel="#L315">315</span>
<span id="LID316" rel="#L316">316</span>
<span id="LID317" rel="#L317">317</span>
<span id="LID318" rel="#L318">318</span>
<span id="LID319" rel="#L319">319</span>
<span id="LID320" rel="#L320">320</span>
<span id="LID321" rel="#L321">321</span>
<span id="LID322" rel="#L322">322</span>
<span id="LID323" rel="#L323">323</span>
<span id="LID324" rel="#L324">324</span>
<span id="LID325" rel="#L325">325</span>
<span id="LID326" rel="#L326">326</span>
<span id="LID327" rel="#L327">327</span>
<span id="LID328" rel="#L328">328</span>
<span id="LID329" rel="#L329">329</span>
<span id="LID330" rel="#L330">330</span>
<span id="LID331" rel="#L331">331</span>
<span id="LID332" rel="#L332">332</span>
<span id="LID333" rel="#L333">333</span>
<span id="LID334" rel="#L334">334</span>
<span id="LID335" rel="#L335">335</span>
<span id="LID336" rel="#L336">336</span>
<span id="LID337" rel="#L337">337</span>
<span id="LID338" rel="#L338">338</span>
<span id="LID339" rel="#L339">339</span>
<span id="LID340" rel="#L340">340</span>
<span id="LID341" rel="#L341">341</span>
<span id="LID342" rel="#L342">342</span>
<span id="LID343" rel="#L343">343</span>
<span id="LID344" rel="#L344">344</span>
<span id="LID345" rel="#L345">345</span>
<span id="LID346" rel="#L346">346</span>
<span id="LID347" rel="#L347">347</span>
<span id="LID348" rel="#L348">348</span>
<span id="LID349" rel="#L349">349</span>
<span id="LID350" rel="#L350">350</span>
<span id="LID351" rel="#L351">351</span>
<span id="LID352" rel="#L352">352</span>
<span id="LID353" rel="#L353">353</span>
<span id="LID354" rel="#L354">354</span>
</pre>
          </td>
          <td width="100%">
            
              <div class="highlight"><pre><div class="line" id="LC1"><span class="c1">#--</span></div><div class="line" id="LC2"><span class="c1"># ==================================================================</span></div><div class="line" id="LC3"><span class="c1"># Author: Jamis Buck (jamis@jamisbuck.org)</span></div><div class="line" id="LC4"><span class="c1"># Date: 2008-10-09</span></div><div class="line" id="LC5"><span class="c1"># </span></div><div class="line" id="LC6"><span class="c1"># This file is in the public domain. Usage, modification, and</span></div><div class="line" id="LC7"><span class="c1"># redistribution of this file are unrestricted.</span></div><div class="line" id="LC8"><span class="c1"># ==================================================================</span></div><div class="line" id="LC9"><span class="c1">#++</span></div><div class="line" id="LC10">&nbsp;</div><div class="line" id="LC11"><span class="c1"># The &quot;fuzzy&quot; file finder provides a way for searching a directory</span></div><div class="line" id="LC12"><span class="c1"># tree with only a partial name. This is similar to the &quot;cmd-T&quot;</span></div><div class="line" id="LC13"><span class="c1"># feature in TextMate (http://macromates.com).</span></div><div class="line" id="LC14"><span class="c1"># </span></div><div class="line" id="LC15"><span class="c1"># Usage:</span></div><div class="line" id="LC16"><span class="c1"># </span></div><div class="line" id="LC17"><span class="c1">#   finder = FuzzyFileFinder.new</span></div><div class="line" id="LC18"><span class="c1">#   finder.search(&quot;app/blogcon&quot;) do |match|</span></div><div class="line" id="LC19"><span class="c1">#     puts match[:highlighted_path]</span></div><div class="line" id="LC20"><span class="c1">#   end</span></div><div class="line" id="LC21"><span class="c1">#</span></div><div class="line" id="LC22"><span class="c1"># In the above example, all files matching &quot;app/blogcon&quot; will be</span></div><div class="line" id="LC23"><span class="c1"># yielded to the block. The given pattern is reduced to a regular</span></div><div class="line" id="LC24"><span class="c1"># expression internally, so that any file that contains those</span></div><div class="line" id="LC25"><span class="c1"># characters in that order (even if there are other characters</span></div><div class="line" id="LC26"><span class="c1"># in between) will match.</span></div><div class="line" id="LC27"><span class="c1"># </span></div><div class="line" id="LC28"><span class="c1"># In other words, &quot;app/blogcon&quot; would match any of the following</span></div><div class="line" id="LC29"><span class="c1"># (parenthesized strings indicate how the match was made):</span></div><div class="line" id="LC30"><span class="c1"># </span></div><div class="line" id="LC31"><span class="c1"># * (app)/controllers/(blog)_(con)troller.rb</span></div><div class="line" id="LC32"><span class="c1"># * lib/c(ap)_(p)ool/(bl)ue_(o)r_(g)reen_(co)loratio(n)</span></div><div class="line" id="LC33"><span class="c1"># * test/(app)/(blog)_(con)troller_test.rb</span></div><div class="line" id="LC34"><span class="c1">#</span></div><div class="line" id="LC35"><span class="c1"># And so forth.</span></div><div class="line" id="LC36"><span class="k">class</span> <span class="nc">FuzzyFileFinder</span></div><div class="line" id="LC37">&nbsp;&nbsp;<span class="k">module</span> <span class="nn">Version</span></div><div class="line" id="LC38">&nbsp;&nbsp;&nbsp;&nbsp;<span class="no">MAJOR</span> <span class="o">=</span> <span class="mi">1</span></div><div class="line" id="LC39">&nbsp;&nbsp;&nbsp;&nbsp;<span class="no">MINOR</span> <span class="o">=</span> <span class="mi">0</span></div><div class="line" id="LC40">&nbsp;&nbsp;&nbsp;&nbsp;<span class="no">TINY</span>  <span class="o">=</span> <span class="mi">4</span></div><div class="line" id="LC41">&nbsp;&nbsp;&nbsp;&nbsp;<span class="no">STRING</span> <span class="o">=</span> <span class="o">[</span><span class="no">MAJOR</span><span class="p">,</span> <span class="no">MINOR</span><span class="p">,</span> <span class="no">TINY</span><span class="o">].</span><span class="n">join</span><span class="p">(</span><span class="s2">&quot;.&quot;</span><span class="p">)</span></div><div class="line" id="LC42">&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC43">&nbsp;</div><div class="line" id="LC44">&nbsp;&nbsp;<span class="c1"># This is the exception that is raised if you try to scan a</span></div><div class="line" id="LC45">&nbsp;&nbsp;<span class="c1"># directory tree with too many entries. By default, a ceiling of</span></div><div class="line" id="LC46">&nbsp;&nbsp;<span class="c1"># 10,000 entries is enforced, but you can change that number via</span></div><div class="line" id="LC47">&nbsp;&nbsp;<span class="c1"># the +ceiling+ parameter to FuzzyFileFinder.new.</span></div><div class="line" id="LC48">&nbsp;&nbsp;<span class="k">class</span> <span class="nc">TooManyEntries</span> <span class="o">&lt;</span> <span class="no">RuntimeError</span><span class="p">;</span> <span class="k">end</span></div><div class="line" id="LC49">&nbsp;</div><div class="line" id="LC50">&nbsp;&nbsp;<span class="c1"># Used internally to represent a run of characters within a</span></div><div class="line" id="LC51">&nbsp;&nbsp;<span class="c1"># match. This is used to build the highlighted version of</span></div><div class="line" id="LC52">&nbsp;&nbsp;<span class="c1"># a file name.</span></div><div class="line" id="LC53">&nbsp;&nbsp;<span class="k">class</span> <span class="nc">CharacterRun</span> <span class="o">&lt;</span> <span class="no">Struct</span><span class="o">.</span><span class="n">new</span><span class="p">(</span><span class="ss">:string</span><span class="p">,</span> <span class="ss">:inside</span><span class="p">)</span> <span class="c1">#:nodoc:</span></div><div class="line" id="LC54">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">to_s</span></div><div class="line" id="LC55">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="n">inside</span></div><div class="line" id="LC56">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;(</span><span class="si">#{</span><span class="n">string</span><span class="si">}</span><span class="s2">)&quot;</span></div><div class="line" id="LC57">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span></div><div class="line" id="LC58">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">string</span></div><div class="line" id="LC59">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC60">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC61">&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC62">&nbsp;</div><div class="line" id="LC63">&nbsp;&nbsp;<span class="c1"># Used internally to represent a file within the directory tree.</span></div><div class="line" id="LC64">&nbsp;&nbsp;<span class="k">class</span> <span class="nc">FileSystemEntry</span> <span class="c1">#:nodoc:</span></div><div class="line" id="LC65">&nbsp;&nbsp;&nbsp;&nbsp;<span class="kp">attr_reader</span> <span class="ss">:parent</span></div><div class="line" id="LC66">&nbsp;&nbsp;&nbsp;&nbsp;<span class="kp">attr_reader</span> <span class="ss">:name</span></div><div class="line" id="LC67">&nbsp;</div><div class="line" id="LC68">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">initialize</span><span class="p">(</span><span class="n">parent</span><span class="p">,</span> <span class="nb">name</span><span class="p">)</span></div><div class="line" id="LC69">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@parent</span> <span class="o">=</span> <span class="n">parent</span></div><div class="line" id="LC70">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@name</span> <span class="o">=</span> <span class="nb">name</span></div><div class="line" id="LC71">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC72">&nbsp;</div><div class="line" id="LC73">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">path</span></div><div class="line" id="LC74">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="no">File</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="n">parent</span><span class="o">.</span><span class="n">name</span><span class="p">,</span> <span class="nb">name</span><span class="p">)</span></div><div class="line" id="LC75">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC76">&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC77">&nbsp;</div><div class="line" id="LC78">&nbsp;&nbsp;<span class="c1"># Used internally to represent a subdirectory within the directory</span></div><div class="line" id="LC79">&nbsp;&nbsp;<span class="c1"># tree.</span></div><div class="line" id="LC80">&nbsp;&nbsp;<span class="k">class</span> <span class="nc">Directory</span> <span class="c1">#:nodoc:</span></div><div class="line" id="LC81">&nbsp;&nbsp;&nbsp;&nbsp;<span class="kp">attr_reader</span> <span class="ss">:name</span></div><div class="line" id="LC82">&nbsp;</div><div class="line" id="LC83">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">initialize</span><span class="p">(</span><span class="nb">name</span><span class="p">,</span> <span class="n">is_root</span><span class="o">=</span><span class="kp">false</span><span class="p">)</span></div><div class="line" id="LC84">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@name</span> <span class="o">=</span> <span class="nb">name</span></div><div class="line" id="LC85">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@is_root</span> <span class="o">=</span> <span class="n">is_root</span></div><div class="line" id="LC86">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC87">&nbsp;</div><div class="line" id="LC88">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">root?</span></div><div class="line" id="LC89">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">is_root</span></div><div class="line" id="LC90">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC91">&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC92">&nbsp;</div><div class="line" id="LC93">&nbsp;&nbsp;<span class="c1"># The roots directory trees to search.</span></div><div class="line" id="LC94">&nbsp;&nbsp;<span class="kp">attr_reader</span> <span class="ss">:roots</span></div><div class="line" id="LC95">&nbsp;</div><div class="line" id="LC96">&nbsp;&nbsp;<span class="c1"># The list of files beneath all +roots+</span></div><div class="line" id="LC97">&nbsp;&nbsp;<span class="kp">attr_reader</span> <span class="ss">:files</span></div><div class="line" id="LC98">&nbsp;</div><div class="line" id="LC99">&nbsp;&nbsp;<span class="c1"># The maximum number of files beneath all +roots+</span></div><div class="line" id="LC100">&nbsp;&nbsp;<span class="kp">attr_reader</span> <span class="ss">:ceiling</span></div><div class="line" id="LC101">&nbsp;</div><div class="line" id="LC102">&nbsp;&nbsp;<span class="c1"># The prefix shared by all +roots+.</span></div><div class="line" id="LC103">&nbsp;&nbsp;<span class="kp">attr_reader</span> <span class="ss">:shared_prefix</span></div><div class="line" id="LC104">&nbsp;</div><div class="line" id="LC105">&nbsp;&nbsp;<span class="c1"># The list of glob patterns to ignore.</span></div><div class="line" id="LC106">&nbsp;&nbsp;<span class="kp">attr_reader</span> <span class="ss">:ignores</span></div><div class="line" id="LC107">&nbsp;</div><div class="line" id="LC108">&nbsp;&nbsp;<span class="c1"># Initializes a new FuzzyFileFinder. This will scan the</span></div><div class="line" id="LC109">&nbsp;&nbsp;<span class="c1"># given +directories+, using +ceiling+ as the maximum number</span></div><div class="line" id="LC110">&nbsp;&nbsp;<span class="c1"># of entries to scan. If there are more than +ceiling+ entries</span></div><div class="line" id="LC111">&nbsp;&nbsp;<span class="c1"># a TooManyEntries exception will be raised.</span></div><div class="line" id="LC112">&nbsp;&nbsp;<span class="k">def</span> <span class="nf">initialize</span><span class="p">(</span><span class="n">directories</span><span class="o">=[</span><span class="s1">&#39;.&#39;</span><span class="o">]</span><span class="p">,</span> <span class="n">ceiling</span><span class="o">=</span><span class="mi">10_000</span><span class="p">,</span> <span class="n">ignores</span><span class="o">=</span><span class="kp">nil</span><span class="p">)</span></div><div class="line" id="LC113">&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">directories</span> <span class="o">=</span> <span class="nb">Array</span><span class="p">(</span><span class="n">directories</span><span class="p">)</span></div><div class="line" id="LC114">&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">directories</span> <span class="o">&lt;&lt;</span> <span class="s2">&quot;.&quot;</span> <span class="k">if</span> <span class="n">directories</span><span class="o">.</span><span class="n">empty?</span></div><div class="line" id="LC115">&nbsp;</div><div class="line" id="LC116">&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># expand any paths with ~</span></div><div class="line" id="LC117">&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">root_dirnames</span> <span class="o">=</span> <span class="n">directories</span><span class="o">.</span><span class="n">map</span> <span class="p">{</span> <span class="o">|</span><span class="n">d</span><span class="o">|</span> <span class="no">File</span><span class="o">.</span><span class="n">expand_path</span><span class="p">(</span><span class="n">d</span><span class="p">)</span> <span class="p">}</span><span class="o">.</span><span class="n">select</span> <span class="p">{</span> <span class="o">|</span><span class="n">d</span><span class="o">|</span> <span class="no">File</span><span class="o">.</span><span class="n">directory?</span><span class="p">(</span><span class="n">d</span><span class="p">)</span> <span class="p">}</span><span class="o">.</span><span class="n">uniq</span></div><div class="line" id="LC118">&nbsp;</div><div class="line" id="LC119">&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@roots</span> <span class="o">=</span> <span class="n">root_dirnames</span><span class="o">.</span><span class="n">map</span> <span class="p">{</span> <span class="o">|</span><span class="n">d</span><span class="o">|</span> <span class="no">Directory</span><span class="o">.</span><span class="n">new</span><span class="p">(</span><span class="n">d</span><span class="p">,</span> <span class="kp">true</span><span class="p">)</span> <span class="p">}</span></div><div class="line" id="LC120">&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@shared_prefix</span> <span class="o">=</span> <span class="n">determine_shared_prefix</span></div><div class="line" id="LC121">&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@shared_prefix_re</span> <span class="o">=</span> <span class="no">Regexp</span><span class="o">.</span><span class="n">new</span><span class="p">(</span><span class="s2">&quot;^</span><span class="si">#{</span><span class="no">Regexp</span><span class="o">.</span><span class="n">escape</span><span class="p">(</span><span class="n">shared_prefix</span><span class="p">)</span><span class="si">}</span><span class="s2">&quot;</span> <span class="o">+</span> <span class="p">(</span><span class="n">shared_prefix</span><span class="o">.</span><span class="n">empty?</span> <span class="p">?</span> <span class="s2">&quot;&quot;</span> <span class="p">:</span> <span class="s2">&quot;/&quot;</span><span class="p">))</span></div><div class="line" id="LC122">&nbsp;</div><div class="line" id="LC123">&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@files</span> <span class="o">=</span> <span class="o">[]</span></div><div class="line" id="LC124">&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@ceiling</span> <span class="o">=</span> <span class="n">ceiling</span></div><div class="line" id="LC125">&nbsp;</div><div class="line" id="LC126">&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@ignores</span> <span class="o">=</span> <span class="nb">Array</span><span class="p">(</span><span class="n">ignores</span><span class="p">)</span></div><div class="line" id="LC127">&nbsp;</div><div class="line" id="LC128">&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">rescan!</span></div><div class="line" id="LC129">&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC130">&nbsp;</div><div class="line" id="LC131">&nbsp;&nbsp;<span class="c1"># Rescans the subtree. If the directory contents every change,</span></div><div class="line" id="LC132">&nbsp;&nbsp;<span class="c1"># you&#39;ll need to call this to force the finder to be aware of</span></div><div class="line" id="LC133">&nbsp;&nbsp;<span class="c1"># the changes.</span></div><div class="line" id="LC134">&nbsp;&nbsp;<span class="k">def</span> <span class="nf">rescan!</span></div><div class="line" id="LC135">&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@files</span><span class="o">.</span><span class="n">clear</span></div><div class="line" id="LC136">&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">roots</span><span class="o">.</span><span class="n">each</span> <span class="p">{</span> <span class="o">|</span><span class="n">root</span><span class="o">|</span> <span class="n">follow_tree</span><span class="p">(</span><span class="n">root</span><span class="p">)</span> <span class="p">}</span></div><div class="line" id="LC137">&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC138">&nbsp;</div><div class="line" id="LC139">&nbsp;&nbsp;<span class="c1"># Takes the given +pattern+ (which must be a string) and searches</span></div><div class="line" id="LC140">&nbsp;&nbsp;<span class="c1"># all files beneath +root+, yielding each match.</span></div><div class="line" id="LC141">&nbsp;&nbsp;<span class="c1">#</span></div><div class="line" id="LC142">&nbsp;&nbsp;<span class="c1"># +pattern+ is interpreted thus:</span></div><div class="line" id="LC143">&nbsp;&nbsp;<span class="c1">#</span></div><div class="line" id="LC144">&nbsp;&nbsp;<span class="c1"># * &quot;foo&quot; : look for any file with the characters &#39;f&#39;, &#39;o&#39;, and &#39;o&#39;</span></div><div class="line" id="LC145">&nbsp;&nbsp;<span class="c1">#   in its basename (discounting directory names). The characters</span></div><div class="line" id="LC146">&nbsp;&nbsp;<span class="c1">#   must be in that order.</span></div><div class="line" id="LC147">&nbsp;&nbsp;<span class="c1"># * &quot;foo/bar&quot; : look for any file with the characters &#39;b&#39;, &#39;a&#39;,</span></div><div class="line" id="LC148">&nbsp;&nbsp;<span class="c1">#   and &#39;r&#39; in its basename (discounting directory names). Also,</span></div><div class="line" id="LC149">&nbsp;&nbsp;<span class="c1">#   any successful match must also have at least one directory</span></div><div class="line" id="LC150">&nbsp;&nbsp;<span class="c1">#   element matching the characters &#39;f&#39;, &#39;o&#39;, and &#39;o&#39; (in that</span></div><div class="line" id="LC151">&nbsp;&nbsp;<span class="c1">#   order.</span></div><div class="line" id="LC152">&nbsp;&nbsp;<span class="c1"># * &quot;foo/bar/baz&quot; : same as &quot;foo/bar&quot;, but matching two</span></div><div class="line" id="LC153">&nbsp;&nbsp;<span class="c1">#   directory elements in addition to a file name of &quot;baz&quot;.</span></div><div class="line" id="LC154">&nbsp;&nbsp;<span class="c1">#</span></div><div class="line" id="LC155">&nbsp;&nbsp;<span class="c1"># Each yielded match will be a hash containing the following keys:</span></div><div class="line" id="LC156">&nbsp;&nbsp;<span class="c1">#</span></div><div class="line" id="LC157">&nbsp;&nbsp;<span class="c1"># * :path refers to the full path to the file</span></div><div class="line" id="LC158">&nbsp;&nbsp;<span class="c1"># * :directory refers to the directory of the file</span></div><div class="line" id="LC159">&nbsp;&nbsp;<span class="c1"># * :name refers to the name of the file (without directory)</span></div><div class="line" id="LC160">&nbsp;&nbsp;<span class="c1"># * :highlighted_directory refers to the directory of the file with</span></div><div class="line" id="LC161">&nbsp;&nbsp;<span class="c1">#   matches highlighted in parentheses.</span></div><div class="line" id="LC162">&nbsp;&nbsp;<span class="c1"># * :highlighted_name refers to the name of the file with matches</span></div><div class="line" id="LC163">&nbsp;&nbsp;<span class="c1">#   highlighted in parentheses</span></div><div class="line" id="LC164">&nbsp;&nbsp;<span class="c1"># * :highlighted_path refers to the full path of the file with</span></div><div class="line" id="LC165">&nbsp;&nbsp;<span class="c1">#   matches highlighted in parentheses</span></div><div class="line" id="LC166">&nbsp;&nbsp;<span class="c1"># * :abbr refers to an abbreviated form of :highlighted_path, where</span></div><div class="line" id="LC167">&nbsp;&nbsp;<span class="c1">#   path segments without matches are compressed to just their first</span></div><div class="line" id="LC168">&nbsp;&nbsp;<span class="c1">#   character.</span></div><div class="line" id="LC169">&nbsp;&nbsp;<span class="c1"># * :score refers to a value between 0 and 1 indicating how closely</span></div><div class="line" id="LC170">&nbsp;&nbsp;<span class="c1">#   the file matches the given pattern. A score of 1 means the</span></div><div class="line" id="LC171">&nbsp;&nbsp;<span class="c1">#   pattern matches the file exactly.</span></div><div class="line" id="LC172">&nbsp;&nbsp;<span class="k">def</span> <span class="nf">search</span><span class="p">(</span><span class="n">pattern</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">block</span><span class="p">)</span></div><div class="line" id="LC173">&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">pattern</span><span class="o">.</span><span class="n">gsub!</span><span class="p">(</span><span class="s2">&quot; &quot;</span><span class="p">,</span> <span class="s2">&quot;&quot;</span><span class="p">)</span></div><div class="line" id="LC174">&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">path_parts</span> <span class="o">=</span> <span class="n">pattern</span><span class="o">.</span><span class="n">split</span><span class="p">(</span><span class="s2">&quot;/&quot;</span><span class="p">)</span></div><div class="line" id="LC175">&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">path_parts</span><span class="o">.</span><span class="n">push</span> <span class="s2">&quot;&quot;</span> <span class="k">if</span> <span class="n">pattern</span><span class="o">[-</span><span class="mi">1</span><span class="p">,</span><span class="mi">1</span><span class="o">]</span> <span class="o">==</span> <span class="s2">&quot;/&quot;</span></div><div class="line" id="LC176">&nbsp;</div><div class="line" id="LC177">&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">file_name_part</span> <span class="o">=</span> <span class="n">path_parts</span><span class="o">.</span><span class="n">pop</span> <span class="o">||</span> <span class="s2">&quot;&quot;</span></div><div class="line" id="LC178">&nbsp;</div><div class="line" id="LC179">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="n">path_parts</span><span class="o">.</span><span class="n">any?</span></div><div class="line" id="LC180">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">path_regex_raw</span> <span class="o">=</span> <span class="s2">&quot;^(.*?)&quot;</span> <span class="o">+</span> <span class="n">path_parts</span><span class="o">.</span><span class="n">map</span> <span class="p">{</span> <span class="o">|</span><span class="n">part</span><span class="o">|</span> <span class="n">make_pattern</span><span class="p">(</span><span class="n">part</span><span class="p">)</span> <span class="p">}</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="s2">&quot;(.*?/.*?)&quot;</span><span class="p">)</span> <span class="o">+</span> <span class="s2">&quot;(.*?)$&quot;</span></div><div class="line" id="LC181">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">path_regex</span> <span class="o">=</span> <span class="no">Regexp</span><span class="o">.</span><span class="n">new</span><span class="p">(</span><span class="n">path_regex_raw</span><span class="p">,</span> <span class="no">Regexp</span><span class="o">::</span><span class="no">IGNORECASE</span><span class="p">)</span></div><div class="line" id="LC182">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC183">&nbsp;</div><div class="line" id="LC184">&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">file_regex_raw</span> <span class="o">=</span> <span class="s2">&quot;^(.*?)&quot;</span> <span class="o">&lt;&lt;</span> <span class="n">make_pattern</span><span class="p">(</span><span class="n">file_name_part</span><span class="p">)</span> <span class="o">&lt;&lt;</span> <span class="s2">&quot;(.*)$&quot;</span></div><div class="line" id="LC185">&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">file_regex</span> <span class="o">=</span> <span class="no">Regexp</span><span class="o">.</span><span class="n">new</span><span class="p">(</span><span class="n">file_regex_raw</span><span class="p">,</span> <span class="no">Regexp</span><span class="o">::</span><span class="no">IGNORECASE</span><span class="p">)</span></div><div class="line" id="LC186">&nbsp;</div><div class="line" id="LC187">&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">path_matches</span> <span class="o">=</span> <span class="p">{}</span></div><div class="line" id="LC188">&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">files</span><span class="o">.</span><span class="n">each</span> <span class="k">do</span> <span class="o">|</span><span class="n">file</span><span class="o">|</span></div><div class="line" id="LC189">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">path_match</span> <span class="o">=</span> <span class="n">match_path</span><span class="p">(</span><span class="n">file</span><span class="o">.</span><span class="n">parent</span><span class="p">,</span> <span class="n">path_matches</span><span class="p">,</span> <span class="n">path_regex</span><span class="p">,</span> <span class="n">path_parts</span><span class="o">.</span><span class="n">length</span><span class="p">)</span></div><div class="line" id="LC190">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">next</span> <span class="k">if</span> <span class="n">path_match</span><span class="o">[</span><span class="ss">:missed</span><span class="o">]</span></div><div class="line" id="LC191">&nbsp;</div><div class="line" id="LC192">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">match_file</span><span class="p">(</span><span class="n">file</span><span class="p">,</span> <span class="n">file_regex</span><span class="p">,</span> <span class="n">path_match</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">block</span><span class="p">)</span></div><div class="line" id="LC193">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC194">&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC195">&nbsp;</div><div class="line" id="LC196">&nbsp;&nbsp;<span class="c1"># Takes the given +pattern+ (which must be a string, formatted as</span></div><div class="line" id="LC197">&nbsp;&nbsp;<span class="c1"># described in #search), and returns up to +max+ matches in an</span></div><div class="line" id="LC198">&nbsp;&nbsp;<span class="c1"># Array. If +max+ is nil, all matches will be returned.</span></div><div class="line" id="LC199">&nbsp;&nbsp;<span class="k">def</span> <span class="nf">find</span><span class="p">(</span><span class="n">pattern</span><span class="p">,</span> <span class="n">max</span><span class="o">=</span><span class="kp">nil</span><span class="p">)</span></div><div class="line" id="LC200">&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">results</span> <span class="o">=</span> <span class="o">[]</span></div><div class="line" id="LC201">&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">search</span><span class="p">(</span><span class="n">pattern</span><span class="p">)</span> <span class="k">do</span> <span class="o">|</span><span class="n">match</span><span class="o">|</span></div><div class="line" id="LC202">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">results</span> <span class="o">&lt;&lt;</span> <span class="n">match</span></div><div class="line" id="LC203">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">break</span> <span class="k">if</span> <span class="n">max</span> <span class="o">&amp;&amp;</span> <span class="n">results</span><span class="o">.</span><span class="n">length</span> <span class="o">&gt;=</span> <span class="n">max</span></div><div class="line" id="LC204">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC205">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span> <span class="n">results</span></div><div class="line" id="LC206">&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC207">&nbsp;</div><div class="line" id="LC208">&nbsp;&nbsp;<span class="c1"># Displays the finder object in a sane, non-explosive manner.</span></div><div class="line" id="LC209">&nbsp;&nbsp;<span class="k">def</span> <span class="nf">inspect</span> <span class="c1">#:nodoc:</span></div><div class="line" id="LC210">&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;#&lt;%s:0x%x roots=%s, files=%d&gt;&quot;</span> <span class="o">%</span> <span class="o">[</span><span class="nb">self</span><span class="o">.</span><span class="n">class</span><span class="o">.</span><span class="n">name</span><span class="p">,</span> <span class="nb">object_id</span><span class="p">,</span> <span class="n">roots</span><span class="o">.</span><span class="n">map</span> <span class="p">{</span> <span class="o">|</span><span class="n">r</span><span class="o">|</span> <span class="n">r</span><span class="o">.</span><span class="n">name</span><span class="o">.</span><span class="n">inspect</span> <span class="p">}</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="s2">&quot;, &quot;</span><span class="p">),</span> <span class="n">files</span><span class="o">.</span><span class="n">length</span><span class="o">]</span></div><div class="line" id="LC211">&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC212">&nbsp;</div><div class="line" id="LC213">&nbsp;&nbsp;<span class="kp">private</span></div><div class="line" id="LC214">&nbsp;</div><div class="line" id="LC215">&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Recursively scans +directory+ and all files and subdirectories</span></div><div class="line" id="LC216">&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># beneath it, depth-first.</span></div><div class="line" id="LC217">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">follow_tree</span><span class="p">(</span><span class="n">directory</span><span class="p">)</span></div><div class="line" id="LC218">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="no">Dir</span><span class="o">.</span><span class="n">entries</span><span class="p">(</span><span class="n">directory</span><span class="o">.</span><span class="n">name</span><span class="p">)</span><span class="o">.</span><span class="n">each</span> <span class="k">do</span> <span class="o">|</span><span class="n">entry</span><span class="o">|</span></div><div class="line" id="LC219">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">next</span> <span class="k">if</span> <span class="n">entry</span><span class="o">[</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="o">]</span> <span class="o">==</span> <span class="s2">&quot;.&quot;</span></div><div class="line" id="LC220">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">raise</span> <span class="no">TooManyEntries</span> <span class="k">if</span> <span class="n">files</span><span class="o">.</span><span class="n">length</span> <span class="o">&gt;</span> <span class="n">ceiling</span></div><div class="line" id="LC221">&nbsp;</div><div class="line" id="LC222">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">full</span> <span class="o">=</span> <span class="no">File</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="n">directory</span><span class="o">.</span><span class="n">name</span><span class="p">,</span> <span class="n">entry</span><span class="p">)</span></div><div class="line" id="LC223">&nbsp;</div><div class="line" id="LC224">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="no">File</span><span class="o">.</span><span class="n">directory?</span><span class="p">(</span><span class="n">full</span><span class="p">)</span></div><div class="line" id="LC225">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">follow_tree</span><span class="p">(</span><span class="no">Directory</span><span class="o">.</span><span class="n">new</span><span class="p">(</span><span class="n">full</span><span class="p">))</span></div><div class="line" id="LC226">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">elsif</span> <span class="o">!</span><span class="n">ignore?</span><span class="p">(</span><span class="n">full</span><span class="o">.</span><span class="n">sub</span><span class="p">(</span><span class="vi">@shared_prefix_re</span><span class="p">,</span> <span class="s2">&quot;&quot;</span><span class="p">))</span></div><div class="line" id="LC227">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">files</span><span class="o">.</span><span class="n">push</span><span class="p">(</span><span class="no">FileSystemEntry</span><span class="o">.</span><span class="n">new</span><span class="p">(</span><span class="n">directory</span><span class="p">,</span> <span class="n">entry</span><span class="p">))</span></div><div class="line" id="LC228">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC229">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC230">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC231">&nbsp;</div><div class="line" id="LC232">&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Returns +true+ if the given name matches any of the ignore</span></div><div class="line" id="LC233">&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># patterns.</span></div><div class="line" id="LC234">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">ignore?</span><span class="p">(</span><span class="nb">name</span><span class="p">)</span></div><div class="line" id="LC235">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">ignores</span><span class="o">.</span><span class="n">any?</span> <span class="p">{</span> <span class="o">|</span><span class="n">pattern</span><span class="o">|</span> <span class="no">File</span><span class="o">.</span><span class="n">fnmatch</span><span class="p">(</span><span class="n">pattern</span><span class="p">,</span> <span class="nb">name</span><span class="p">)</span> <span class="p">}</span></div><div class="line" id="LC236">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC237">&nbsp;</div><div class="line" id="LC238">&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Takes the given pattern string &quot;foo&quot; and converts it to a new</span></div><div class="line" id="LC239">&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># string &quot;(f)([^/]*?)(o)([^/]*?)(o)&quot; that can be used to create</span></div><div class="line" id="LC240">&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># a regular expression.</span></div><div class="line" id="LC241">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">make_pattern</span><span class="p">(</span><span class="n">pattern</span><span class="p">)</span></div><div class="line" id="LC242">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">pattern</span> <span class="o">=</span> <span class="n">pattern</span><span class="o">.</span><span class="n">split</span><span class="p">(</span><span class="sr">//</span><span class="p">)</span></div><div class="line" id="LC243">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">pattern</span> <span class="o">&lt;&lt;</span> <span class="s2">&quot;&quot;</span> <span class="k">if</span> <span class="n">pattern</span><span class="o">.</span><span class="n">empty?</span></div><div class="line" id="LC244">&nbsp;</div><div class="line" id="LC245">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">pattern</span><span class="o">.</span><span class="n">inject</span><span class="p">(</span><span class="s2">&quot;&quot;</span><span class="p">)</span> <span class="k">do</span> <span class="o">|</span><span class="n">regex</span><span class="p">,</span> <span class="n">character</span><span class="o">|</span></div><div class="line" id="LC246">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">regex</span> <span class="o">&lt;&lt;</span> <span class="s2">&quot;([^/]*?)&quot;</span> <span class="k">if</span> <span class="n">regex</span><span class="o">.</span><span class="n">length</span> <span class="o">&gt;</span> <span class="mi">0</span></div><div class="line" id="LC247">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">regex</span> <span class="o">&lt;&lt;</span> <span class="s2">&quot;(&quot;</span> <span class="o">&lt;&lt;</span> <span class="no">Regexp</span><span class="o">.</span><span class="n">escape</span><span class="p">(</span><span class="n">character</span><span class="p">)</span> <span class="o">&lt;&lt;</span> <span class="s2">&quot;)&quot;</span></div><div class="line" id="LC248">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC249">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC250">&nbsp;</div><div class="line" id="LC251">&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Given a MatchData object +match+ and a number of &quot;inside&quot;</span></div><div class="line" id="LC252">&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># segments to support, compute both the match score and  the</span></div><div class="line" id="LC253">&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># highlighted match string. The &quot;inside segments&quot; refers to how</span></div><div class="line" id="LC254">&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># many patterns were matched in this one match. For a file name,</span></div><div class="line" id="LC255">&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># this will always be one. For directories, it will be one for</span></div><div class="line" id="LC256">&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># each directory segment in the original pattern.</span></div><div class="line" id="LC257">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">build_match_result</span><span class="p">(</span><span class="n">match</span><span class="p">,</span> <span class="n">inside_segments</span><span class="p">)</span></div><div class="line" id="LC258">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">runs</span> <span class="o">=</span> <span class="o">[]</span></div><div class="line" id="LC259">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">inside_chars</span> <span class="o">=</span> <span class="n">total_chars</span> <span class="o">=</span> <span class="mi">0</span></div><div class="line" id="LC260">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">match</span><span class="o">.</span><span class="n">captures</span><span class="o">.</span><span class="n">each_with_index</span> <span class="k">do</span> <span class="o">|</span><span class="n">capture</span><span class="p">,</span> <span class="n">index</span><span class="o">|</span></div><div class="line" id="LC261">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="n">capture</span><span class="o">.</span><span class="n">length</span> <span class="o">&gt;</span> <span class="mi">0</span></div><div class="line" id="LC262">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># odd-numbered captures are matches inside the pattern.</span></div><div class="line" id="LC263">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># even-numbered captures are matches between the pattern&#39;s elements.</span></div><div class="line" id="LC264">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">inside</span> <span class="o">=</span> <span class="n">index</span> <span class="o">%</span> <span class="mi">2</span> <span class="o">!=</span> <span class="mi">0</span></div><div class="line" id="LC265">&nbsp;</div><div class="line" id="LC266">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">total_chars</span> <span class="o">+=</span> <span class="n">capture</span><span class="o">.</span><span class="n">gsub</span><span class="p">(</span><span class="sr">%r(/)</span><span class="p">,</span> <span class="s2">&quot;&quot;</span><span class="p">)</span><span class="o">.</span><span class="n">length</span> <span class="c1"># ignore &#39;/&#39; delimiters</span></div><div class="line" id="LC267">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">inside_chars</span> <span class="o">+=</span> <span class="n">capture</span><span class="o">.</span><span class="n">length</span> <span class="k">if</span> <span class="n">inside</span></div><div class="line" id="LC268">&nbsp;</div><div class="line" id="LC269">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="n">runs</span><span class="o">.</span><span class="n">last</span> <span class="o">&amp;&amp;</span> <span class="n">runs</span><span class="o">.</span><span class="n">last</span><span class="o">.</span><span class="n">inside</span> <span class="o">==</span> <span class="n">inside</span></div><div class="line" id="LC270">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">runs</span><span class="o">.</span><span class="n">last</span><span class="o">.</span><span class="n">string</span> <span class="o">&lt;&lt;</span> <span class="n">capture</span></div><div class="line" id="LC271">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span></div><div class="line" id="LC272">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">runs</span> <span class="o">&lt;&lt;</span> <span class="no">CharacterRun</span><span class="o">.</span><span class="n">new</span><span class="p">(</span><span class="n">capture</span><span class="p">,</span> <span class="n">inside</span><span class="p">)</span></div><div class="line" id="LC273">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC274">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC275">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC276">&nbsp;</div><div class="line" id="LC277">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Determine the score of this match.</span></div><div class="line" id="LC278">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># 1. fewer &quot;inside runs&quot; (runs corresponding to the original pattern)</span></div><div class="line" id="LC279">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#    is better.</span></div><div class="line" id="LC280">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># 2. better coverage of the actual path name is better</span></div><div class="line" id="LC281">&nbsp;</div><div class="line" id="LC282">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">inside_runs</span> <span class="o">=</span> <span class="n">runs</span><span class="o">.</span><span class="n">select</span> <span class="p">{</span> <span class="o">|</span><span class="n">r</span><span class="o">|</span> <span class="n">r</span><span class="o">.</span><span class="n">inside</span> <span class="p">}</span></div><div class="line" id="LC283">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">run_ratio</span> <span class="o">=</span> <span class="n">inside_runs</span><span class="o">.</span><span class="n">length</span><span class="o">.</span><span class="n">zero?</span> <span class="p">?</span> <span class="mi">1</span> <span class="p">:</span> <span class="n">inside_segments</span> <span class="o">/</span> <span class="n">inside_runs</span><span class="o">.</span><span class="n">length</span><span class="o">.</span><span class="n">to_f</span></div><div class="line" id="LC284">&nbsp;</div><div class="line" id="LC285">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">char_ratio</span> <span class="o">=</span> <span class="n">total_chars</span><span class="o">.</span><span class="n">zero?</span> <span class="p">?</span> <span class="mi">1</span> <span class="p">:</span> <span class="n">inside_chars</span><span class="o">.</span><span class="n">to_f</span> <span class="o">/</span> <span class="n">total_chars</span></div><div class="line" id="LC286">&nbsp;</div><div class="line" id="LC287">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">score</span> <span class="o">=</span> <span class="n">run_ratio</span> <span class="o">*</span> <span class="n">char_ratio</span></div><div class="line" id="LC288">&nbsp;</div><div class="line" id="LC289">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span> <span class="p">{</span> <span class="ss">:score</span> <span class="o">=&gt;</span> <span class="n">score</span><span class="p">,</span> <span class="ss">:result</span> <span class="o">=&gt;</span> <span class="n">runs</span><span class="o">.</span><span class="n">join</span> <span class="p">}</span></div><div class="line" id="LC290">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC291">&nbsp;</div><div class="line" id="LC292">&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Match the given path against the regex, caching the result in +path_matches+.</span></div><div class="line" id="LC293">&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># If +path+ is already cached in the path_matches cache, just return the cached</span></div><div class="line" id="LC294">&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># value.</span></div><div class="line" id="LC295">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">match_path</span><span class="p">(</span><span class="n">path</span><span class="p">,</span> <span class="n">path_matches</span><span class="p">,</span> <span class="n">path_regex</span><span class="p">,</span> <span class="n">path_segments</span><span class="p">)</span></div><div class="line" id="LC296">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span> <span class="n">path_matches</span><span class="o">[</span><span class="n">path</span><span class="o">]</span> <span class="k">if</span> <span class="n">path_matches</span><span class="o">.</span><span class="n">key?</span><span class="p">(</span><span class="n">path</span><span class="p">)</span></div><div class="line" id="LC297">&nbsp;</div><div class="line" id="LC298">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">name_with_slash</span> <span class="o">=</span> <span class="n">path</span><span class="o">.</span><span class="n">name</span> <span class="o">+</span> <span class="s2">&quot;/&quot;</span> <span class="c1"># add a trailing slash for matching the prefix</span></div><div class="line" id="LC299">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">matchable_name</span> <span class="o">=</span> <span class="n">name_with_slash</span><span class="o">.</span><span class="n">sub</span><span class="p">(</span><span class="vi">@shared_prefix_re</span><span class="p">,</span> <span class="s2">&quot;&quot;</span><span class="p">)</span></div><div class="line" id="LC300">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">matchable_name</span><span class="o">.</span><span class="n">chop!</span> <span class="c1"># kill the trailing slash</span></div><div class="line" id="LC301">&nbsp;</div><div class="line" id="LC302">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="n">path_regex</span></div><div class="line" id="LC303">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">match</span> <span class="o">=</span> <span class="n">matchable_name</span><span class="o">.</span><span class="n">match</span><span class="p">(</span><span class="n">path_regex</span><span class="p">)</span></div><div class="line" id="LC304">&nbsp;</div><div class="line" id="LC305">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">path_matches</span><span class="o">[</span><span class="n">path</span><span class="o">]</span> <span class="o">=</span></div><div class="line" id="LC306">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">match</span> <span class="o">&amp;&amp;</span> <span class="n">build_match_result</span><span class="p">(</span><span class="n">match</span><span class="p">,</span> <span class="n">path_segments</span><span class="p">)</span> <span class="o">||</span></div><div class="line" id="LC307">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">{</span> <span class="ss">:score</span> <span class="o">=&gt;</span> <span class="mi">1</span><span class="p">,</span> <span class="ss">:result</span> <span class="o">=&gt;</span> <span class="n">matchable_name</span><span class="p">,</span> <span class="ss">:missed</span> <span class="o">=&gt;</span> <span class="kp">true</span> <span class="p">}</span></div><div class="line" id="LC308">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span></div><div class="line" id="LC309">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">path_matches</span><span class="o">[</span><span class="n">path</span><span class="o">]</span> <span class="o">=</span> <span class="p">{</span> <span class="ss">:score</span> <span class="o">=&gt;</span> <span class="mi">1</span><span class="p">,</span> <span class="ss">:result</span> <span class="o">=&gt;</span> <span class="n">matchable_name</span> <span class="p">}</span></div><div class="line" id="LC310">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC311">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC312">&nbsp;</div><div class="line" id="LC313">&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Match +file+ against +file_regex+. If it matches, yield the match</span></div><div class="line" id="LC314">&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># metadata to the block.</span></div><div class="line" id="LC315">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">match_file</span><span class="p">(</span><span class="n">file</span><span class="p">,</span> <span class="n">file_regex</span><span class="p">,</span> <span class="n">path_match</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">block</span><span class="p">)</span></div><div class="line" id="LC316">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="n">file_match</span> <span class="o">=</span> <span class="n">file</span><span class="o">.</span><span class="n">name</span><span class="o">.</span><span class="n">match</span><span class="p">(</span><span class="n">file_regex</span><span class="p">)</span></div><div class="line" id="LC317">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">match_result</span> <span class="o">=</span> <span class="n">build_match_result</span><span class="p">(</span><span class="n">file_match</span><span class="p">,</span> <span class="mi">1</span><span class="p">)</span></div><div class="line" id="LC318">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">full_match_result</span> <span class="o">=</span> <span class="n">path_match</span><span class="o">[</span><span class="ss">:result</span><span class="o">].</span><span class="n">empty?</span> <span class="p">?</span> <span class="n">match_result</span><span class="o">[</span><span class="ss">:result</span><span class="o">]</span> <span class="p">:</span> <span class="no">File</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="n">path_match</span><span class="o">[</span><span class="ss">:result</span><span class="o">]</span><span class="p">,</span> <span class="n">match_result</span><span class="o">[</span><span class="ss">:result</span><span class="o">]</span><span class="p">)</span></div><div class="line" id="LC319">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">shortened_path</span> <span class="o">=</span> <span class="n">path_match</span><span class="o">[</span><span class="ss">:result</span><span class="o">].</span><span class="n">gsub</span><span class="p">(</span><span class="sr">/[^\/]+/</span><span class="p">)</span> <span class="p">{</span> <span class="o">|</span><span class="n">m</span><span class="o">|</span> <span class="n">m</span><span class="o">.</span><span class="n">index</span><span class="p">(</span><span class="s2">&quot;(&quot;</span><span class="p">)</span> <span class="p">?</span> <span class="n">m</span> <span class="p">:</span> <span class="n">m</span><span class="o">[</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="o">]</span> <span class="p">}</span></div><div class="line" id="LC320">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">abbr</span> <span class="o">=</span> <span class="n">shortened_path</span><span class="o">.</span><span class="n">empty?</span> <span class="p">?</span> <span class="n">match_result</span><span class="o">[</span><span class="ss">:result</span><span class="o">]</span> <span class="p">:</span> <span class="no">File</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="n">shortened_path</span><span class="p">,</span> <span class="n">match_result</span><span class="o">[</span><span class="ss">:result</span><span class="o">]</span><span class="p">)</span></div><div class="line" id="LC321">&nbsp;</div><div class="line" id="LC322">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">result</span> <span class="o">=</span> <span class="p">{</span> <span class="ss">:path</span> <span class="o">=&gt;</span> <span class="n">file</span><span class="o">.</span><span class="n">path</span><span class="p">,</span></div><div class="line" id="LC323">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ss">:abbr</span> <span class="o">=&gt;</span> <span class="n">abbr</span><span class="p">,</span></div><div class="line" id="LC324">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ss">:directory</span> <span class="o">=&gt;</span> <span class="n">file</span><span class="o">.</span><span class="n">parent</span><span class="o">.</span><span class="n">name</span><span class="p">,</span></div><div class="line" id="LC325">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ss">:name</span> <span class="o">=&gt;</span> <span class="n">file</span><span class="o">.</span><span class="n">name</span><span class="p">,</span></div><div class="line" id="LC326">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ss">:highlighted_directory</span> <span class="o">=&gt;</span> <span class="n">path_match</span><span class="o">[</span><span class="ss">:result</span><span class="o">]</span><span class="p">,</span></div><div class="line" id="LC327">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ss">:highlighted_name</span> <span class="o">=&gt;</span> <span class="n">match_result</span><span class="o">[</span><span class="ss">:result</span><span class="o">]</span><span class="p">,</span></div><div class="line" id="LC328">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ss">:highlighted_path</span> <span class="o">=&gt;</span> <span class="n">full_match_result</span><span class="p">,</span></div><div class="line" id="LC329">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ss">:score</span> <span class="o">=&gt;</span> <span class="n">path_match</span><span class="o">[</span><span class="ss">:score</span><span class="o">]</span> <span class="o">*</span> <span class="n">match_result</span><span class="o">[</span><span class="ss">:score</span><span class="o">]</span> <span class="p">}</span></div><div class="line" id="LC330">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">yield</span> <span class="n">result</span></div><div class="line" id="LC331">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC332">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC333">&nbsp;</div><div class="line" id="LC334">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">determine_shared_prefix</span></div><div class="line" id="LC335">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># the common case: if there is only a single root, then the entire</span></div><div class="line" id="LC336">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># name of the root is the shared prefix.</span></div><div class="line" id="LC337">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span> <span class="n">roots</span><span class="o">.</span><span class="n">first</span><span class="o">.</span><span class="n">name</span> <span class="k">if</span> <span class="n">roots</span><span class="o">.</span><span class="n">length</span> <span class="o">==</span> <span class="mi">1</span></div><div class="line" id="LC338">&nbsp;</div><div class="line" id="LC339">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">split_roots</span> <span class="o">=</span> <span class="n">roots</span><span class="o">.</span><span class="n">map</span> <span class="p">{</span> <span class="o">|</span><span class="n">root</span><span class="o">|</span> <span class="n">root</span><span class="o">.</span><span class="n">name</span><span class="o">.</span><span class="n">split</span><span class="p">(</span><span class="sr">%r{/}</span><span class="p">)</span> <span class="p">}</span></div><div class="line" id="LC340">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">segments</span> <span class="o">=</span> <span class="n">split_roots</span><span class="o">.</span><span class="n">map</span> <span class="p">{</span> <span class="o">|</span><span class="n">root</span><span class="o">|</span> <span class="n">root</span><span class="o">.</span><span class="n">length</span> <span class="p">}</span><span class="o">.</span><span class="n">max</span></div><div class="line" id="LC341">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">master</span> <span class="o">=</span> <span class="n">split_roots</span><span class="o">.</span><span class="n">pop</span></div><div class="line" id="LC342">&nbsp;</div><div class="line" id="LC343">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">segments</span><span class="o">.</span><span class="n">times</span> <span class="k">do</span> <span class="o">|</span><span class="n">segment</span><span class="o">|</span></div><div class="line" id="LC344">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="o">!</span><span class="n">split_roots</span><span class="o">.</span><span class="n">all?</span> <span class="p">{</span> <span class="o">|</span><span class="n">root</span><span class="o">|</span> <span class="n">root</span><span class="o">[</span><span class="n">segment</span><span class="o">]</span> <span class="o">==</span> <span class="n">master</span><span class="o">[</span><span class="n">segment</span><span class="o">]</span> <span class="p">}</span></div><div class="line" id="LC345">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span> <span class="n">master</span><span class="o">[</span><span class="mi">0</span><span class="p">,</span><span class="n">segment</span><span class="o">].</span><span class="n">join</span><span class="p">(</span><span class="s2">&quot;/&quot;</span><span class="p">)</span></div><div class="line" id="LC346">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC347">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC348">&nbsp;</div><div class="line" id="LC349">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># shouldn&#39;t ever get here, since we uniq the root list before</span></div><div class="line" id="LC350">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># calling this method, but if we do, somehow...</span></div><div class="line" id="LC351">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span> <span class="n">roots</span><span class="o">.</span><span class="n">first</span><span class="o">.</span><span class="n">name</span></div><div class="line" id="LC352">&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class="line" id="LC353"><span class="k">end</span></div><div class="line" id="LC354">&nbsp;</div></pre></div>
            
          </td>
        </tr>
      </table>
    
  </div>


      </div>
    </div>
    
  


    </div>
  
      

      <div class="push"></div>
    </div>

    <div id="footer">
      <div class="site">
        <div class="info">
          <div class="links">
            <a href="http://github.com/blog"><b>Blog</b></a> |
            <a href="http://support.github.com/">Support</a> |
            <a href="http://github.com/training">Training</a> |
            <a href="http://github.com/contact">Contact</a> |
            <a href="http://develop.github.com">API</a> |
            <a href="http://twitter.com/github">Status</a> |
            <a href="http://twitter.com/github">GitHub on Twitter</a> |
            <a href="http://github.com/guides/home">Help</a>

         </div>
          <div class="company">
            <span id="_rrt" title="0.03570s from fe3.rs.github.com">GitHub</span>&trade;
            is <a href="http://logicalawesome.com/">Logical Awesome</a> &copy;2009 | <a href="/site/terms">Terms of Service</a> | <a href="/site/privacy">Privacy Policy</a>
          </div>
        </div>
        <div class="sponsor">
          <div>
            Powered by the <a href="http://www.rackspace.com ">Dedicated
            Servers</a> and<br/> <a href="http://www.rackspacecloud.com">Cloud
            Computing</a> of Rackspace Hosting<span>&reg;</span>
          </div>
          <a href="http://www.rackspace.com">
            <img alt="Dedicated Server" src="http://assets3.github.com/images/modules/footer/rackspace_logo.png?558f5c2a10480fade1bcff619f06c59239d95ba8" />
          </a>
        </div>
      </div>
    </div>

    <div id="coming_soon" style="display:none;">
      This feature is coming soon.  Sit tight!
    </div>

    
        <script type="text/javascript">
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
    document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
    </script>
    <script type="text/javascript">
    var pageTracker = _gat._getTracker("UA-3769691-2");
    pageTracker._initData();
    pageTracker._trackPageview();
    </script>

    
  </body>
</html>

