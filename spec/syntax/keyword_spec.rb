# frozen_string_literal: true

require 'spec_helper'

describe 'Keyword syntax' do
  it 'for used as keyword' do
    expect(<<~EOF).to include_elixir_syntax('elixirKeyword', 'for')
    for v <- [1, 3, 3]
    EOF
  end

  it 'case used as keyword' do
    expect(<<~EOF).to include_elixir_syntax('elixirKeyword', 'case')
    case true do
    EOF
  end

  it 'defoverridable' do
    expect(<<~EOF).to include_elixir_syntax('elixirKeyword', 'init:')
    defmodule Test do
      defmacro __using__(_options) do
        quote do
          def init(args) do
            {:ok, args}
          end
          defoverridable init: 1
        end
      end
    end
    EOF
  end
end
