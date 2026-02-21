function NewFrame(frameType, frameName, parent, template)
    local frame = CreateFrame(frameType or "Frame", frameName, parent, template)
    function frame:SafeHide()
      if self:GetAlpha() > 0 then 
        if InCombatLockdown() then 
          self:SetAlpha(0)
        else
          UIFrameFadeOut(self, 0.5)
        end
      end
      return self
    end
    function frame:SafeShow()
      if self:GetAlpha() < 1 then 
        if InCombatLockdown() then 
          self:SetAlpha(1)
        else
          UIFrameFadeIn(self, 0.5)
        end
      end
      return self
    end
    function frame:Data(data)
      self.data = data
      return self
    end
    function frame:StatusBarTexture(texture,colour)
      self:SetStatusBarTexture( texture or config.texture.default)
      self:SetStatusBarColor(unpack(colour or {1,1,1}))
      return self
    end
    function frame:Text(text,size,colour)
      self.Text = self:CreateFontString(nil, "ARTWORK")
      self.Text:SetFont("Fonts\\FRIZQT__.TTF", size or config.font.defaultSize)
      self.Text:SetTextColor(unpack( colour or {1,1,1}))
      self.Text:SetJustifyH("CENTER")
      self.Text:SetAllPoints(self)
      self.Text:SetText(text)
      return self
    end
    function frame:Background(colour,condition)
      if Default(condition,true) then
        self.Background = self:CreateTexture(nil, "BACKGROUND")
        self.Background:SetColorTexture(unpack(colour))
        self.Background:SetAllPoints(self)
      end
      return self
    end
    function frame:Point(point, relativeTo, relativePoint, offsetX, offsetY, condition)
      if Default(condition,true) then
        self:SetPoint(point, relativeTo, relativePoint, offsetX, offsetY)
      end
      return self
    end
    function frame:AllPoints(relativeTo,condition)
      if Default(condition,true) then
        self:SetAllPoints(relativeTo)
      end
      return self
    end
    function frame:Height(height)
      self:SetHeight(height)
      return self
    end
    function frame:Width(width)
      self:SetWidth(width)
      return self
    end
    function frame:Event(event, unit, condition)
        if Default(condition,true) then
          if unit then
            self:RegisterUnitEvent(event,unit)
          else
            self:RegisterEvent(event)
          end
        end
        return self
    end
    function frame:Script(func)
        self:SetScript("OnEvent", func)
        return self
    end
    return frame
end

function NewIcon(frame)
    local icon = frame:CreateTexture(nil, "OVERLAY")
    function icon:Point(point, relativeTo, relativePoint, offsetX, offsetY, condition)
      if Default(condition,true) then
        self:SetPoint(point, relativeTo, relativePoint, offsetX, offsetY)
      end
      return self
    end
    function icon:Height(height)
      self:SetHeight(height)
      return self
    end
    function icon:Width(width)
      self:SetWidth(width)
      return self
    end
    return icon
end