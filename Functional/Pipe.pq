  /*

  Piping operations functional style (e.g. R's Magrittr package or the |> operator in F#) improves readability of code by avoiding nesting.

  Rather than f8(f7(f6(f5(f4(f3(f2(f1(x)))))))) we write code in the order the operations take place.

  Example use: 

  let Hash = Pipe(1234)(
      Text.From,
      each Text.ToBinary(_, BinaryEncoding.Base64),
      each Binary.Compress(_, Compression.GZip),
      Binary.ToList,
      each List.LastN(_, 8),
      each List.FirstN(_, 4),
      Binary.FromList,
      each Binary.ToText(_, BinaryEncoding.Hex)
  )

  */
    
  Pipe = (object as any) as function => 
      let RunPipe = (functions as list ) as any => 
          List.Accumulate(
              functions, 
              object, 
              (state, fun) => fun(state)
          )
      in Function.From(type function (fun as function) as any, RunPipe)
