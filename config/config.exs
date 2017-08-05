use Mix.Config

config :mamebus,
  url: "http://www.city.noda.chiba.jp/_res/projects/default_project/_page_/001/010/030/",
  routes: [
    %{
      desc: "関宿城ルート（関宿中央ターミナル行）",
      name: "1607_sekiyadojo_sekiyadotyuuou-terminal_iki.csv"
    },
    %{
      desc: "関宿城ルート（関宿城博物館行）",
      name: "1607_sekiyadojo_sekiyadojouhakubutukan_iki2.csv"
    },
    %{
      desc: "北ルート（市役所行）",
      names: [
        "1607_kita_shiyakusyo_iki_heijitu.csv",
        "1607_kita_shiyakusyo_iki_donitisyukujitu.csv"
      ]
    },
    %{
      desc: "北ルート（関宿中央ターミナル行）",
      names: [
        "1607_kita_sekiyadotyuuou-terminal_iki_heijitu.csv",
        "1607_kita_sekiyadotyuuou-terminal_iki_donitisyukujitu.csv"
      ]
    },
    %{
      desc: "新北ルート（市役所行）",
      name: "1607_shinkita_shiyakusyo_iki.csv"
    },
    %{
      desc: "新北ルート（いちいのホール行）",
      name: "1607_shinkita_itiino-hall_iki.csv"
    },
    %{
      desc: "中ルート（左回り）",
      names: [
        "1607_naka_hidarimawari.csv",
        "1607_naka_migimawari.csv"
      ]
    },
    %{
      desc: "南ルート（左回り）",
      names: [
        "1607_minami_hidarimawari_heijitu.csv",
        "1607_minami_hidarimawari_donitisyukujitu.csv"
      ]
    },
    %{
      desc: "南ルート（右回り）",
      names: [
        "1607_minami_migimawari_heijitu.csv",
        "1607_minami_migimawari_donitisyukujitu.csv"
      ]
    },
    %{
      desc: "新南ルート（みずき4丁目公園行）",
      name: "1607_shinminami_mizukiyontyoumekouen_iki.csv"
    },
    %{
      desc: "新南ルート（大利根温泉行）",
      name: "1607_shinminami_ootoneonsen_iki.csv"
    }
  ]
