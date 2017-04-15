
var
  LArray : array[1..6] of Byte = (10, 11, 12, 13, 14, 15);
  LText: string;
  I : integer;
begin
  try
    SetLength(LText, Length(LArray)*2);
    BinToHex(@LArray, PChar(LText), SizeOf(LArray));
    //show the hex string
    Writeln(LText);

    //fill the array with 0 
    FillChar(LArray, SizeOf(LArray), #0);

    //get the values from the hex string
    HexToBin(PChar(LText), LArray, Length(LArray));

    //show the array values
    for i := 1 to Length(LArray) do
      Write(LArray[i]);
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
