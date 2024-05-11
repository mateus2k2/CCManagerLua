local _b=require("utils").split local ab=require("utils").deepcopy;local bb=require("utils").uuid local cb=require("expect").expect local db={__tostring=function(dc)return dc.type[1]end,__type=function(dc)return dc.type[1]end}db.__index=db;local _c={}local ac={}local bc={}local cc="BasicElement" function db:new(dc,_d,ad) cb(1,self,"table")cb(2,dc,"string","nil")cb(3,_d,"Container","nil") cb(4,ad,"table","nil")local bd={}setmetatable(bd,self)self.__index=self;bd.__noCopy=true bd:create("BasicElement")bd.parent=_d;bd.basalt=ad;bd.Name=dc or bb()return bd end function db:addPropertyObserver(dc,_d)cb(1,self,"table")cb(2,dc,"string") cb(3,_d,"function")if not self.propertyObservers[dc]then self.propertyObservers[dc]={}end table.insert(self.propertyObservers[dc],_d)return self end function db:removePropertyObserver(dc,_d)cb(1,self,"table")cb(2,dc,"string") cb(3,_d,"number","function") if not self.propertyObservers[dc]then return self end if(type(_d)=="number")then table.remove(self.propertyObservers[dc],_d)else for ad,bd in pairs(self.propertyObservers[dc])do if(bd==_d)then table.remove(self.propertyObservers[dc],ad)end end end;return self end function db:forcePropertyObserverUpdate(dc)cb(1,self,"table")cb(2,dc,"string")if not self.propertyObservers[dc]then return self end for _d,ad in pairs(self.propertyObservers[dc])do if(type(ad)=="function")then ad(self,dc)end end;return self end function db:setProperty(dc,_d,ad)cb(1,self,"table")cb(2,dc,"string") cb(4,ad,"function","nil")if(ad~=nil)then _d=ad(self,dc,_d)end;if type(_d)=='table'then _d=ab(_d)end;if(self[dc]~=_d)then self[dc]=_d end if( self.propertyObservers[dc]~=nil)then for bd,cd in pairs(self.propertyObservers[dc])do cd(self,dc,_d)end end;return self end function db:getProperty(dc)cb(1,self,"table")cb(2,dc,"string")local _d=self[dc]if( type(_d)=="function")then return _d()end;return _d end;function db:hasProperty(dc)cb(1,self,"table")cb(2,dc,"string") return self[dc]~=nil end function db:setProperties(dc) cb(1,self,"table")cb(2,dc,"table")for _d,ad in pairs(dc)do self[_d]=ad end;return self end function db:getProperties()cb(1,self,"table")local dc={} for _d,ad in pairs(self)do if(type(ad)=="function")then dc[_d]=ad()else dc[_d]=ad end end;return dc end function db:getPropertyType(dc)cb(1,self,"table")cb(2,dc,"string") for _d,ad in pairs(self.type)do if(ac[ad]~=nil)then if(ac[ad][dc]~=nil)then return ac[ad][dc]end end end end function db:updateRender() if(self.parent~=nil)then self.parent:forceVisibleChildrenUpdate()self.parent:updateRender()else self.updateRendering=true end end function db:addProperty(dc,_d,ad,bd,cd,dd,__a)if(_d==nil)then _d="any"end;if(bd==nil)then bd=false end local a_a=dc:gsub("^%l",string.upper)if not _c[cc]then _c[cc]={}ac[cc]={}end;if(type(ad)=="table")then ad=ab(ad)end;_c[cc][dc]=ad;ac[cc][dc]=_d if not(bd)then self["set"..a_a]=function(b_a,c_a,...) cb(1,b_a,"table") if(cd~=nil)then local d_a=cd(b_a,c_a,...)if(d_a~=nil)then c_a=d_a end end;if __a~=true then b_a:updateRender()end;if(_d~=nil)then cb(2,c_a,"function","dynValue",unpack(_b(_d,"|")))end;b_a:setProperty(dc,c_a) return b_a end end self["get"..a_a]=function(b_a,...)local c_a=b_a:getProperty(dc)if(dd~=nil)then return dd(b_a,c_a,...)end;return c_a end end function db:combineProperty(dc,...)dc=dc:gsub("^%l",string.upper)local _d={...} self["get"..dc]=function(ad) cb(1,ad,"table")local bd={}for cd,dd in pairs(_d)do bd[#bd+1]=ad["get"..dd:gsub("^%l",string.upper)](ad)end;return unpack(bd)end self["set"..dc]=function(ad,...)cb(1,ad,"table")local bd={...} for cd,dd in pairs(_d)do local __a=ad:getPropertyType(dd)if(__a~=nil)then cb(cd+1,bd[cd],ad:getPropertyType(dd),"function","dynValue")end ad["set"..dd:gsub("^%l",string.upper)](ad,bd[cd])end;return ad end;return self end;function db:initialize(dc)cc=dc;return self end;function db:create(dc) if(_c[dc]~=nil)then for _d,ad in pairs(_c[dc])do if(type(ad)=="table")then self[_d]=ab(ad)else self[_d]=ad end end end end function db:addListener(dc,_d) self[ "on"..dc:gsub("^%l",string.upper)]=function(ad,...) cb(1,ad,"table") for bd,cd in pairs({...})do cb(bd+1,cd,"function")if(ad.listeners==nil)then ad.listeners={}end;if(ad.listeners[dc]==nil)then ad.listeners[dc]={}end table.insert(ad.listeners[dc],cd)end;ad:listenEvent(_d)return ad end;return self end function db:fireEvent(dc,...)cb(1,self,"table")cb(2,dc,"string") if (self.listeners~=nil)then if(self.listeners[dc]~=nil)then for _d,ad in pairs(self.listeners[dc])do ad(self,...)end end end;return self end function db:isType(dc)if(self.type~=nil)then for _d,ad in pairs(self.type)do if(ad==dc)then return true end end end;return false end function db:listenEvent(dc,_d)cb(1,self,"table")cb(2,dc,"string") cb(3,_d,"boolean","nil") if(self.parent~=nil)then if(_d)or(_d==nil)then self.parent:addEvent(dc,self)self.events[dc]=true elseif(_d==false)then self.parent:removeEvent(dc,self)self.events[dc]=false end end;return self end function db:updateEvents()cb(1,self,"table") if(self.parent~=nil)then for dc,_d in pairs(self.events)do if(_d)then self.parent:addEvent(dc,self)else self.parent:removeEvent(dc,self)end end end;return self end function db:extend(dc,_d)if(bc[cc]==nil)then bc[cc]={}end;if(bc[cc][dc]==nil)then bc[cc][dc]={}end;table.insert(bc[cc][dc],_d)return self end function db:callExtension(dc)for _d,ad in pairs(self.type)do if(bc[ad]~=nil)then if(bc[ad][dc]~=nil)then for bd,cd in pairs(bc[ad][dc])do cd(self)end end end end;return self end;db:addProperty("Name","string","BasicElement") db:addProperty("type","string|table",{"BasicElement"},false,function(dc,_d) if( type(_d)=="string")then table.insert(dc.type,1,_d)return dc.type end end,function(dc,_d,ad)return dc.type[ad or 1]end) db:addProperty("z","number",1,false,function(dc,_d)dc.z=_d;if(dc.parent~=nil)then dc.parent:updateChild(dc)end;return _d end)db:addProperty("enabled","boolean",true) db:addProperty("parent","table",nil)db:addProperty("events","table",{}) db:addProperty("propertyObservers","table",{})function db:init() if not self.initialized then self:callExtension("Init")end;self:setProperty("initialized",true) self:callExtension("Load")end return db