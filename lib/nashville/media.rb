require 'hashie/rash'

module Nashville
  module Media
    def self.included(base)
      base.send(:extend, ClassMethods)
    end

    module ClassMethods
      def Entity(entity)
        delegator = self

        klass = Class.new(Hashie::Rash) do
          extend ClassMethods

          define_singleton_method(:entity) do
            return entity
          end

          define_singleton_method(:delegator) do
            return delegator
          end

          define_singleton_method(:media) do |*args|
            media = args.first
            if class_variable_defined?(:@@media)
              class_variable_get(:@@media)
            elsif media
              class_variable_set(:@@media, media)
            else
              self.delegator.media
            end
          end

          define_singleton_method(:attributes) do |*args|
            attributes = args
            if class_variable_defined?(:@@attributes)
              class_variable_get(:@@attributes)
            elsif attributes and not attributes.empty?
              class_variable_set(:@@attributes, attributes.collect(&:to_sym))
            else
              self.delegator.attributes
            end
          end

          define_singleton_method(:search) do |params|
            unless params[:term]
              attribute, *additional = params.keys.collect(&:to_sym) & self.attributes
              if not attribute
                raise ArgumentError, "Missing search criteria, specify one of #{self.attributes}"
              elsif not additional.empty?
                raise ArgumentError, "Too many search criteria specified (#{attributes})"
              else
                params[:attribute] = "#{attribute}Term"
                params[:term] = params.delete(attribute)
              end
            end

            params[:media] = self.media
            params[:entity] = self.entity

            results = self.delegator.search(params)
            results.collect{|result| self.new(result)}
          end
        end
      end
    end
  end

  include Media

  class << self
    def search(params = {})
      client.search(params)
    end

    private

    def client
      @@client ||= Client.new
    end
  end
end

require 'nashville/media/audio_book'
require 'nashville/media/ebook'
require 'nashville/media/movie'
require 'nashville/media/music'
require 'nashville/media/podcast'
require 'nashville/media/short_film'
require 'nashville/media/software'
require 'nashville/media/tv_show'
