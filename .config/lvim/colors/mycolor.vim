lua << EOF
package.loaded['mycolor'] = nil
package.loaded['mycolor.util'] = nil
package.loaded['mycolor.colors'] = nil
package.loaded['mycolor.theme'] = nil
package.loaded['mycolor.functions'] = nil

require('mycolor').set()
EOF
