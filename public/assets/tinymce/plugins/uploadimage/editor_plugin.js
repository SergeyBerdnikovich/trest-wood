(function(){return tinymce.PluginManager.requireLangPack("uploadimage"),tinymce.create("tinymce.plugins.UploadImagePlugin",{init:function(e,t){return e.addCommand("mceUploadImage",function(){return e.windowManager.open({file:t+"/dialog.html",width:320+parseInt(e.getLang("uploadimage.delta_width",0)),height:180+parseInt(e.getLang("uploadimage.delta_height",0)),inline:1},{plugin_url:t})}),e.addButton("uploadimage",{title:"uploadimage.desc",cmd:"mceUploadImage",image:t+"/img/uploadimage.png"}),e.onNodeChange.add(function(e,t,n){return t.setActive("uploadimage",n.nodeName==="IMG")})},createControl:function(e,t){return null},getInfo:function(){return{longname:"UploadImage plugin",author:"Per Christian B. Viken (borrows heavily from work done by Peter Shoukry of 77effects.com)",authorurl:"eastblue.org/oss",infourl:"eastblue.org/oss",version:"1.0"}}}),tinymce.PluginManager.add("uploadimage",tinymce.plugins.UploadImagePlugin)})();