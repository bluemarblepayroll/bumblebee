# frozen_string_literal: true

#
# Copyright (c) 2018-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

module Bumblebee
  # A Mutator is a composition of a converter with hash value setting.  It can be a straight
  # converter, or it can be new types which are not directly defined as 'converters.'
  class Mutator
    module Types
      IGNORE = :ignore
    end
    include Mutator::Types

    attr_reader :converter, :type

    def initialize(arg)
      if arg.nil?
        @type = nil
        @converter = NullConverter.new
      elsif mutator?(arg)
        @type = Mutator::Types.const_get(arg.to_s.upcase.to_sym)
        @converter = NullConverter.new
      else
        @type = nil
        @converter = SimpleConverter.new(arg)
      end

      freeze
    end

    def set(object, key, val)
      return object if ignore?

      ObjectInterface.set(object, key, converter.convert(val))
    end

    private

    def ignore?
      type == IGNORE
    end

    def mutator?(arg)
      return false unless arg.is_a?(String) || arg.is_a?(Symbol)

      Mutator::Types.constants.include?(arg.to_s.upcase.to_sym)
    end
  end
end
