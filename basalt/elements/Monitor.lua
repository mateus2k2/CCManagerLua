local ca,da,_b,ab=type,string.len,string.rep,string.sub local bb=require("basaltLoader")local cb=bb.load("Container")local db=setmetatable({},cb) db.__index=db;db:initialize("Monitor") db:addProperty("Monitor","any",nil,nil,function(_c,ac,bc)if(ca(ac=="string"))then ac=peripheral.wrap(ac)end;if(bc~=false)then _c:setSide(peripheral.getName(ac),false)end;_c:setSize(ac.getSize()) _c:setTerm(ac)return ac end) db:addProperty("Side","string",nil,nil,function(_c,ac,bc) if(ca(ac)=="string")then if(peripheral.isPresent(ac))then if( peripheral.getType(ac)=="monitor")then if(_c:getMonitor()==nil)then if(bc~=false)then _c:setMonitor(ac,false)end end;return ac end end end end) function db:new(_c,ac,bc)local cc=cb:new(_c,ac,bc)setmetatable(cc,self) self.__index=self;cc:setType("Monitor")cc:create("Monitor")return cc end function db:event(_c,...)cb.event(self,_c,...) if(_c=="monitor_resize")then local ac=self:getMonitor()self:setSize(ac.getSize())self:setTerm(ac)end end;function db:monitor_touch(_c,...) if(_c==self:getSide())then self.basalt.setFocusedFrame(self)self:mouse_click(1,...)end end;function db:lose_focus() cb.lose_focus(self)self:setCursor(false)end;return db