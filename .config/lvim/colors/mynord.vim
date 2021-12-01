lua << EOF
package.loaded['mynord'] = nil
package.loaded['mynord.util'] = nil
package.loaded['mynord.colors'] = nil
package.loaded['mynord.theme'] = nil
package.loaded['mynord.functions'] = nil

require('mynord').set()
EOF
