```ada
function Check_Range(Num : Integer) return Boolean is
begin
   if Num < 10 or Num > 100 then
      return False;
   else
      return True;
   end if;
end Check_Range;

procedure Example is
   Result : Boolean;
begin
   Result := Check_Range(50);  -- Correct
   Put_Line("Result 1: " & Boolean'Image(Result));

   Result := Check_Range(1000); -- Incorrect: Should raise Constraint_Error if Num is outside the valid range for Integer
   Put_Line("Result 2: " & Boolean'Image(Result));
   -- The Integer type has a defined range in Ada. In this case, exceeding this range
   -- will not result in a runtime error such as an exception or Out_Of_Bounds error.
   -- Instead the result is wrapped. This is a subtle error
   -- which may not be immediately apparent in Ada.
end Example;
```