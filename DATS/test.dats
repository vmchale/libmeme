#include "share/atspre_staload.hats"
#include "$PATSHOMELOCS/hs-bind-0.4.3/runtime.dats"

staload "SATS/meme.sats"

implement main0 (argc, argv) =
  {
    val _ = hs_init(argc, argv)
    val str = string0_copy("some string")
    val spongebob_str = spongebob_case(str)
    val () = println!(spongebob_str)
    val () = free(str)
    val () = free(spongebob_str)
    val _ = hs_exit()
  }

