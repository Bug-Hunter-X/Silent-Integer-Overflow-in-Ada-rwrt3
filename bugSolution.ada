```ada
function Check_Range(Num : Integer range 10..100) return Boolean is
begin
   return True; -- No need for explicit check; range constraint handles it
exception
   when Constraint_Error =>
      return False; -- If the number is out of range
end Check_Range;

procedure Example is
   Result : Boolean;
begin
   Result := Check_Range(50);  -- Correct
   Put_Line("Result 1: " & Boolean'Image(Result));

   Result := Check_Range(1000); -- Correctly raises Constraint_Error
   Put_Line("Result 2: " & Boolean'Image(Result));
exception
   when Constraint_Error =>
     Put_Line("Error: Value out of range");
end Example;
```