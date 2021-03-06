module Lita
  module Handlers
    class Whatis < Handler
      route(
        /^whatis(?:\s+is)?\s(?<term>\w+)(?:\?)?/,
        :lookup,
        command: true,
        help: {
          t('help.whatis.syntax') => t('help.whatis.desc')
        }
      )

      route(
        /^define\s(?<term>\w+)\sis\s(?<definition>.+)$/,
        :define,
        command: true,
        help: {
          t('help.define.syntax') => t('help.define.desc')
        }
      )

      def lookup(response)
        term = response.match_data['term']
        return response.reply(t('whatis.unknown', term: term)) unless known?(term)
        response.reply(format_definition(term, definition(term)))
      end

      def define(response)
        term = response.match_data['term']
        info = response.match_data['definition']
        write(term, info, response.user.id)
        response.reply(format_definition(term, definition(term)))
      end

      private

      def format_definition(term, definition)
        t('whatis.is', term: term, definition: definition)
      end

      def known?(term)
        redis.exists(term.downcase)
      end

      def definition(term)
        redis.hget(term.downcase, 'definition')
      end

      def write(term, definition, owner)
        redis.hset(term.downcase, 'definition', definition)
        redis.hset(term.downcase, 'owner', owner)
      end
    end

    Lita.register_handler(whatis)
  end
end
