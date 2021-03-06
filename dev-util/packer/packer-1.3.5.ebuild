# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-vcs-snapshot

DESCRIPTION="A tool to create identical machine images for multiple platforms"
HOMEPAGE="https://www.packer.io"

EGO_PN="github.com/hashicorp/packer"
SRC_URI="https://github.com/hashicorp/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DEPEND=">=dev-lang/go-1.11.0"

DOCS="README.md CHANGELOG.md"

src_compile() {
	cd "src/${EGO_PN}" || die
	GOPATH="${S}" GOCACHE="${T}/go-cache" go build \
		-v -work -o "${S}/${PN}" ./ || die
}

src_install() {
	dobin packer

	pushd "src/${EGO_PN}" || die
	einstalldocs
	insinto /usr/share/zsh/site-functions
	doins contrib/zsh-completion/_packer
	popd || die
}
