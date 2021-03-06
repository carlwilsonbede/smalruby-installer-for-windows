# -*- coding: utf-8 -*-
module RubyToBlock
  module Block
    class LooksSay < CharacterMethodCall
      blocknize '^\s*' + CHAR_RE + 'say\(message:\s*("[^"]*")\)\s*$',
                statement: true, inline: true

      def self.process_match_data(md, context)
        md2 = regexp.match(md[type])

        block = new
        _, context.current_block =
          *add_child_or_create_character_new_block(context, md2[1], block)
        process_value_string(context, block, md2[2], :TEXT)

        true
      end
    end
  end
end
