defmodule CosmicEduWeb.Components do
  @moduledoc """
  Componentes simples
  """

  use Phoenix.Component

  @nav_links [
    {"#sobre-andromeda", "Apresentação"},
    {"#aulas", "Notas de Aula"},
    {"#referencias", "Referências"}
  ]

  def navbar(assigns) do
    assigns = assign(assigns, :links, @nav_links)

    ~H"""
    <nav class="bg-space-blue text-white">
      <ul class="flex justify-around p-4">
        <.navlink :for={{anchor, label} <- @links} anchor={anchor} label={label} />
      </ul>
    </nav>
    """
  end

  attr :anchor, :string, required: true
  attr :label, :string, required: true

  defp navlink(assigns) do
    ~H"""
    <li>
      <a href={@anchor} class="hover:text-galactic-silver">
        <%= @label %>
      </a>
    </li>
    """
  end

  @class_notes [
    {"Aula 01 - Introdução a Programação Funcional",
     "https://lmojimuatryimzxjwbex.supabase.co/storage/v1/object/public/cosmic-edu/aula_01.pdf?t=2024-04-01T01%3A19%3A53.704Z"},
    {"Aula 02 - Introdução a Elixir, recursão e Pattern Matching",
     "https://lmojimuatryimzxjwbex.supabase.co/storage/v1/object/public/cosmic-edu/aula_02.pdf?t=2024-04-01T01%3A19%3A53.704Z"},
    {"Aula 03 - Avançando com Elixir",
     "https://lmojimuatryimzxjwbex.supabase.co/storage/v1/object/public/cosmic-edu/aula_03.pdf?t=2024-04-01T01%3A19%3A53.74Z"}
  ]

  def class_notes_section(assigns) do
    assigns = assign(assigns, :links, @class_notes)

    ~H"""
    <section id="aulas" class="p-8">
      <h2 class="text-3xl mb-4">Notas de Aula</h2>
      <ul>
        <.section_link :for={{label, anchor} <- @links} anchor={anchor} label={label} />
      </ul>
    </section>
    """
  end

  attr :anchor, :string, required: true
  attr :label, :string, required: true

  defp section_link(assigns) do
    ~H"""
    <li>
      <a href={@anchor} class="hover:text-deep-space">
        <%= @label %>
      </a>
    </li>
    """
  end

  @refs [
    {"Documentação Oficial da linguagem", "https://hexdocs.pm/elixir"},
    {"Elixir School", "https://elixirschool.com/pt"},
    {"Trilha Exercism", "https://exercism.org/tracks/elixir"},
    {"Introduction to Functional Programming (EN)",
     "https://www.edx.org/learn/computer-programming/delft-university-of-technology-introduction-to-functional-programming"},
    {"A Beginners Guide to Elixir (EN)",
     "https://medium.com/@clairedigitalogy/a-beginners-guide-to-elixir-906603251f06"},
    {"Why Functional Programming have emphasis on recursion? (EN)",
     "https://stackoverflow.com/questions/12659581/functional-programming-lots-of-emphasis-on-recursion-why"},
    {"Pattern Matching in Functional Programming (EN)",
     "https://adabeat.com/fp/pattern-matching-in-functional-programming/"},
    {"Elixir - Functions and Pattern Matching (EN)",
     "https://inquisitivedeveloper.com/lwm-elixir-23/"},
    {"Elixir in Action - third edition (EN)",
     "https://www.manning.com/books/elixir-in-action-third-edition"},
    {"Learn Functional Programming with Elixir (EN)",
     "https://www.amazon.com/Learn-Functional-Programming-Elixir-Foundations/dp/168050245X"},
    {"Algorithms for Functional Programming (EN)",
     "https://www.amazon.com.br/Algorithms-Functional-Programming-David-Stone/dp/3662579685"},
    {"Algorithms: A Functional Programming Approach (EN)",
     "https://www.amazon.com/Algorithms-Functional-Programming-Approach-International/dp/0201596040"},
    {"Functional Programming for dummies (EN)",
     "https://www.amazon.com/Functional-Programming-Dummies-Computer-Tech/dp/1119527503"},
    {"An introduction to Functional Programming trough lambda calculus (EN)",
     "https://cs.rochester.edu/~brown/173/readings/LCBook.pdf"},
    {"Functional Thinking: Paradigm over syntax (EN)",
     "https://www.amazon.in/Functional-Thinking-Paradigm-Over-Syntax-ebook/dp/B00LEX6SP8"},
    {"Programação Funcional para Leigos",
     "https://www.amazon.com.br/Programação-Funcional-Para-Leigos-Mueller/dp/8550813494"},
    {"Programação Funcional: Uma introdução em Clojure",
     "https://www.amazon.com.br/Programação-Funcional-Uma-introdução-Clojure-ebook/dp/B07PFFQ7NL"},
    {"Algoritmos Funcionais: introdução minimalista à lógica de programação funcional pura aplicada à teoria dos conjuntos",
     "https://www.amazon.com.br/Algoritmos-funcionais-introdução-minimalista-programação/dp/8550814474/ref=asc_df_8550814474/?tag=googleshopp00-20&linkCode=df0&hvadid=379792215563&hvpos=&hvnetw=g&hvrand=8549554698823015121&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1001646&hvtargid=pla-1046672187107&psc=1&mcid=7eadfb6634ff3609b87f34f4fb4c6d48"},
    {"Elixir: do zero à concorrência",
     "https://www.amazon.com.br/Elixir-Do-zero-à-concorrência-ebook/dp/B06Y5SWJR8"}
  ]

  def references(assigns) do
    assigns = assign(assigns, :links, @refs)

    ~H"""
    <section id="referencias" class="p-8">
      <h2 class="text-3xl mb-4">Referências Bibliográficas</h2>
      <ul>
        <.section_link :for={{label, anchor} <- @links} anchor={anchor} label={label} />
      </ul>
    </section>
    """
  end

  @exercises [
    {"Lista 01 - Funções", "https://github.com/andromeda-fie/elixar/tree/main/01-funções"},
    {"Lista 02 - Recursão", "https://github.com/andromeda-fie/elixar/tree/main/02-recursão"},
    {"Lista 03 - Lógica Funcional",
     "https://github.com/andromeda-fie/elixar/tree/main/03-lógica-funcional"},
    {"Lista 04 - Sintaxe Elixir",
     "https://github.com/andromeda-fie/elixar/tree/main/04-sintaxe-elixir"},
    {"Lista 05 - Enum", "https://github.com/andromeda-fie/elixar/tree/main/05-enum"}
  ]

  def exercises_list_section(assigns) do
    assigns = assign(assigns, :links, @exercises)

    ~H"""
    <section id="referencias" class="p-8">
      <h2 class="text-3xl mb-4">Lista de Exercícios</h2>
      <ul>
        <.section_link :for={{label, anchor} <- @links} anchor={anchor} label={label} />
      </ul>
      <div class="mt-2 flex-col justify-around align-end">
        <.fancy_link
          anchor="https://github.com/andromeda-fie/elixar/blob/main/tutorial-git.md"
          label="Siga o tutorial Git/GitHub"
        />
        <.fancy_link
          anchor="https://github.com/andromeda-fie/elixar/fork"
          label="Faça fork do repositório das listas"
        />
      </div>
    </section>
    """
  end

  attr :anchor, :string, required: true
  attr :label, :string, required: true

  defp fancy_link(assigns) do
    ~H"""
    <a
      href={@anchor}
      class="inline-block bg-deep-space text-stellar-white font-bold py-2 px-4 rounded hover:bg-galactic-silver transition duration-300 text-xs"
      target="_blank"
    >
      <%= @label %>
    </a>
    """
  end
end
