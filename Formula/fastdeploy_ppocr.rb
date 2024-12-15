class FastdeployPpocr < Formula
  desc "Stripped-down version of PaddlePaddle/FastDeploy"
  homepage "https://github.com/MaaAssistantArknights/FastDeploy"
  url "https://github.com/MaaAssistantArknights/FastDeploy/archive/2896b6d3641c18218209c496ea149a773373fa8b.tar.gz"
  version "2024.5.30"
  sha256 "5ee3dbad183b56ebf42569497c58a646d069a92fef54afce108d1e3422bb03f9"
  license "Apache-2.0"

  livecheck do
    skip "This formula is not tagged, so there is no version to check"
  end

  bottle do
    root_url "https://github.com/MaaAssistantArknights/homebrew-tap/releases/download/fastdeploy_ppocr-2024.3.13_4"
    sha256 cellar: :any,                 arm64_sonoma: "5613edd926f12ddaeac926267e1c033604445e1b15978f7dfe2e7e7c367fab03"
    sha256 cellar: :any,                 ventura:      "656ff6dcfe3efc1593cbe0be61199946b8b241bcc7dddc439b9ee79227f8f6e9"
    sha256 cellar: :any,                 monterey:     "6fbe04bea3180010501f575278475975071bb099d63392af5859436db6d15b27"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "702b0ce254243fa73bec70d1300264e8e56dafcfcacab24d35357773d33c65d5"
  end

  depends_on "cmake" => :build
  depends_on "eigen" => :build

  depends_on "onnxruntime"

  # opencv is a very large dependency, and we only need a small part of it
  # so we build our own opencv if user does not want to install opencv by homebrew
  if build.with? "opencv"
    depends_on "opencv"
  else
    depends_on "opencv-maa"
  end

  def install
    cmake_args = %w[
      -DBUILD_SHARED_LIBS=ON
      -DCMAKE_POSITION_INDEPENDENT_CODE=ON
    ]

    system "cmake", "-S", ".", "-B", "build", *cmake_args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
end
