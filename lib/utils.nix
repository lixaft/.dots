{
  concatAttrs = kv: sep: attrs: let
    pairs = map (name: "${name}=${attrs.${name}}") (builtins.attrNames attrs);
    result = builtins.concatStringsSep ":" pairs;
  in
    result;
}
