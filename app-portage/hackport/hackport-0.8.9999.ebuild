# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.2.1.9999
#hackport: flags: +cabal-v1,gentoo-tests:test,+pedantic

CABAL_FEATURES="test-suite"
inherit haskell-cabal git-r3

LIVE_EBUILD=yes

EGIT_REPO_URI="https://github.com/gentoo-haskell/hackport.git"
EGIT_BRANCH="master"
EGIT_SUBMODULES=( '*' )

S="${WORKDIR}/hackport-0.8.9999"

DESCRIPTION="Hackage and Portage integration tool"
HOMEPAGE="https://hackage.haskell.org/package/hackport"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

GHC_BOOTSTRAP_PACKAGES=(
	cabal-doctest
)

RDEPEND=">=dev-haskell/async-2.0:=
	>=dev-haskell/base16-bytestring-0.1.1:=
	>=dev-haskell/base64-bytestring-1.0:=
	>=dev-haskell/cryptohash-sha256-0.11:=
	>=dev-haskell/echo-0.1.3:=
	>=dev-haskell/ed25519-0.0:=
	>=dev-haskell/edit-distance-0.2.2:=
	dev-haskell/extensible-exceptions:=
	>=dev-haskell/hashable-1.0:=
	>=dev-haskell/http-4000.1.5:=
	dev-haskell/lifted-base:=
	dev-haskell/monad-control:=
	>=dev-haskell/network-3.0:=
	>=dev-haskell/network-uri-2.6.0.2:=
	<dev-haskell/optparse-applicative-0.17:=
	>=dev-haskell/parallel-3.2.1.0:=
	dev-haskell/parser-combinators:=
	dev-haskell/quickcheck:2=
	>=dev-haskell/random-1:=
	>=dev-haskell/regex-base-0.94.0.0:=
	>=dev-haskell/regex-posix-0.96.0.0:=
	>=dev-haskell/resolv-0.1.1:=
	dev-haskell/split:=
	>=dev-haskell/stm-2.0:=
	>=dev-haskell/tar-0.5.0.3:=
	dev-haskell/xml:=
	>=dev-haskell/zlib-0.5.3:=
	>=dev-lang/ghc-8.4.3:=
	>=dev-haskell/process-1.6.16:=
	dev-haskell/safe-exceptions
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-3.0
	dev-haskell/cabal-doctest
	test? ( dev-haskell/base-compat
		>=dev-haskell/doctest-0.8
		dev-haskell/glob
		>=dev-haskell/hspec-2.0
		>=dev-haskell/quickcheck-2.0
		dev-haskell/hunit )
"
RDEPEND+=" dev-util/pkgcheck"

src_prepare() {
	eapply_user
}

src_configure() {
	haskell-cabal_src_configure \
		--flag=cabal-v1 \
		$(cabal_flag test gentoo-test)
}

src_install() {
	haskell-cabal_src_install
	doman man/hackport.1
}
